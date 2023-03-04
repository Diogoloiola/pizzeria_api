module Sales
  module V1
    class SellersController < ApiController
      before_action :set_seller, only: %i[show update destroy]
      def index
        @sellers = Seller.all
      end

      def show; end

      def create
        result = SellerService::CreateSeller.new.create_seller(seller_params)
        @seller = result.seller

        if result.created?
          render :show, status: :created
        else
          render json: @seller.errors, status: :unprocessable_entity
        end
      end

      def update
        if @seller.update(seller_params)
          render :show, status: :ok
        else
          render json: @seller.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @seller.destroy
      end

      private

      def set_seller
        @seller = Seller.find(params[:id])
      end

      def seller_params
        return {} unless params.key?(:seller)

        params.require(:seller).permit(:email, :cpf, :name, :profile).merge(skip_password_validation: true)
      end
    end
  end
end
