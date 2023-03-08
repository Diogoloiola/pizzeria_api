module PizzaService
  class CreatePizzaService
    def create_pizza(params)
      if params[:prices_attribues].empty?
        return Result.new(valid: false, errors: 'Nao existe uma tabela de precos para essa pizza')
      end

      pizza = Pizza.create(params)

      if pizza.valid?
        Result.new(valid: true, pizza:)
      else
        Result.new(valid: false, pizza:, errors: pizza.errors.join(', '))
      end
    end

    class Result
      attr_reader :error, :pizza

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
