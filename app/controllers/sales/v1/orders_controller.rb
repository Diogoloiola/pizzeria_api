module Sales
  module V1
    class OrdersController < ApiController
      before_action :set_sales, only: %i[show update destroy]

      def index
        @orders = Order.all
      end

      def show; end

      def create
        @order = Order.new(sales_order_params)

        if @order.save
          render :show, status: :created
        else
          render json: @order.errors, status: :unprocessable_entity
        end
      end

      def update
        if @order.update(sales_order_params)
          render :show, status: :ok
        else
          render json: @order.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @order.destroy
      end

      private

      def set_sales
        @order = Order.find(params[:id])
      end

      def sales_order_params
        params.require(:sales_v1_order).permit(:seller_id, :discount_code, itens_attributes: %i[pizza_id size])
      end
    end
  end
end
