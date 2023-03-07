module Sales
  module V1
    class PromotionalCodesController < ApiController
      before_action :set_promotional_code, only: %i[show update destroy]

      def index
        @promotional_codes = PromotionalCode.all
      end

      def show; end

      def create
        @promotional_code = PromotionalCode.new(promotional_code_params)

        if @promotional_code.save
          render :show, status: :created
        else
          render json: @promotional_code.errors, status: :unprocessable_entity
        end
      end

      def update
        if @promotional_code.update(promotional_code_params)
          render :show, status: :ok
        else
          render json: @promotional_code.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @promotional_code.destroy
      end

      private

      def set_promotional_code
        @promotional_code = PromotionalCode.find(params[:id])
      end

      def promotional_code_params
        params.require(:promotional_code).permit(:from, :to, :code, :target_id, :size)
      end
    end
  end
end
