module Sales
  module V1
    class IngredientsController < ApiController
      before_action :set_ingredient, only: %i[show update destroy]

      def index
        @ingredients = Ingredient.all
      end

      def show; end

      def create
        @ingredient = Ingredient.new(ingredient_params)

        if @ingredient.save
          render :show, status: :created
        else
          render json: @ingredient.errors, status: :unprocessable_entity
        end
      end

      def update
        if @ingredient.update(ingredient_params)
          render :show, status: :ok
        else
          render json: @ingredient.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @ingredient.destroy
      end

      private

      def set_ingredient
        @ingredient = Ingredient.find(params[:id])
      end

      def ingredient_params
        params.require(:ingredient).permit(:name, :multiplier)
      end
    end
  end
end
