module Sales
  module V1
    class PizzasController < ApplicationController
      before_action :set_pizza, only: %i[show update destroy]

      def index
        @pizzas = Pizza.all
      end

      def show; end

      def create
        @pizza = Pizza.new(pizza_params)

        if @pizza.save
          render :show, status: :created
        else
          render json: @pizza.errors, status: :unprocessable_entity
        end
      end

      def update
        if @pizza.update(pizza_params)
          render :show, status: :ok
        else
          render json: @pizza.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @pizza.destroy
      end

      private

      def set_pizza
        @pizza = Pizza.find(params[:id])
      end

      def pizza_params
        params.require(:pizza).permit(:name, :value, :active)
      end
    end
  end
end
