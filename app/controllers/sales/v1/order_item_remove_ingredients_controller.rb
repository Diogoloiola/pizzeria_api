module Sales
  module V1
    class OrderItemRemoveIngredientsController < ApiController
      before_action :set_item_remove_ingredient, only: %i[destroy]

      def create
        @item_remove_ingredient = OrderItemRemoveIngredient.new(item_remove_ingredient_params)

        if @item_remove_ingredient.save
          render :show, status: :created
        else
          render json: @item_remove_ingredient.errors, status: :unprocessable_entity
        end
      end

      def update
        if @item_remove_ingredient.update(item_remove_ingredient_params)
          render :show, status: :ok
        else
          render json: @item_remove_ingredient.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @item_remove_ingredient.destroy
      end

      private

      def set_item_remove_ingredient
        @item_remove_ingredient = OrderItemRemoveIngredient.find(params[:id])
      end

      def item_remove_ingredient_params
        params.require(:item_remove_ingredient).permit(:order_id, :ingredient_id)
      end
    end
  end
end
