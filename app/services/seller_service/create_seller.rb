module SellerService
  class CreateSeller
    def create_seller(seller_params)
      seller = Seller.create! seller_params

      if seller.valid?
        SellerMailer.with(seller:).welcome_email.deliver_now
        Result.new(valid: true, seller:)
      else
        Result.new(valid: false, seller:)
      end
    rescue StandardError => e
      Result.new(valid: false, errors: e.message)
    end

    class Result
      attr_reader :seller, :errors

      def initialize(valid:, seller: nil, errors: nil)
        @valid = valid
        @seller = seller
        @errors = errors
      end

      def created?
        @valid
      end
    end
  end
end
