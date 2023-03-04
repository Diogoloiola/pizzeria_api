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
    end

    class Result
      attr_reader :seller

      def initialize(valid:, seller:)
        @valid = valid
        @seller = seller
      end

      def created?
        @valid
      end
    end
  end
end
