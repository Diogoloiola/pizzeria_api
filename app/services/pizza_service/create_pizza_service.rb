module PizzaService
  class CreatePizzaService
    def create_pizza(params)
      if params[:prices_attributes].nil? || params[:prices_attributes].empty?
        return Result.new(valid: false, errors: 'Nao existe uma tabela de precos para essa pizza')
      end

      pizza = Pizza.new(params)
      if pizza.save
        Result.new(valid: true, pizza:)
      else
        Result.new(valid: false, errors: pizza.errors.objects.map(&:full_message).join(', '))
      end
    end

    class Result
      attr_reader :errors, :pizza

      def initialize(valid:, pizza: nil, errors: nil)
        @valid = valid
        @pizza = pizza
        @errors = errors
      end

      def created?
        @valid
      end
    end
  end
end
