module Sales
  module V1
    class ApiController < ApplicationController
      before_action :authenticate_seller!
    end
  end
end
