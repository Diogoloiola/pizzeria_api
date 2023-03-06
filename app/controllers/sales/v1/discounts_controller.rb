module Sales
  module V1
    class DiscountsController < ApiController
      before_action :set_discount, only: %i[show update destroy]

      def index
        @discounts = Discount.all
      end

      def show; end

      def create
        @discount = Discount.new(discount_params)

        if @discount.save
          render :show, status: :created
        else
          render json: @discount.errors, status: :unprocessable_entity
        end
      end

      def update
        if @discount.update(discount_params)
          render :show, status: :ok
        else
          render json: @discount.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @discount.destroy
      end

      private

      def set_discount
        @discount = Discount.find(params[:id])
      end

      def discount_params
        params.require(:discount).permit(:deduction_in_percent, :code)
      end
    end
  end
end
