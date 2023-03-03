module Sales
  module V1
    class SellersController < ApiController
      before_action :set_seller, only: %i[show update destroy]
      def index
        @sellers = Seller.all
      end

      def show; end

      def create
        @seller = Seller.new(seller_params)

        if @seller.save
          render :show, status: :created, location: @seller
        else
          render json: @seller.errors, status: :unprocessable_entity
        end
      end

      def update
        if @seller.update(seller_params)
          render :show, status: :ok, location: @seller
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

        params.require(:seller).permit(:email, :cpf, :name)
      end
    end
  end
end
