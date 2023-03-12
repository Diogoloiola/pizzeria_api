module Sales
  module V1
    class OrderItemAddIngredientsController < ApiController
      before_action :set_order_add_ingredient, only: %i[destroy]

      def create
        @order_add_ingredient = OrderItemAddIngredient.new(order_add_ingredient_params)

        if @order_add_ingredient.save
          render :show, status: :created
        else
          render json: @order_add_ingredient.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @order_add_ingredient.destroy
      end

      private

      def set_order_add_ingredient
        @order_add_ingredient = OrderItemAddIngredient.find(params[:id])
      end

      def order_add_ingredient_params
        params.require(:order_add_ingredient).permit(:order_id, :ingredient_id)
      end
    end
  end
end
