namespace :sales, defaults: { format: :json } do
  namespace :v1 do
    resources :sellers
    resources :pizzas
    resources :ingredients
    resources :discounts
    resources :promotional_codes
    resources :orders
    resources :order_item_add_ingredients, only: %i[create destroy]
  end
end
