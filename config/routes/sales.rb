namespace :sales, defaults: { format: :json } do
  namespace :v1 do
    resources :sellers
    resources :pizzas
    resources :ingredients
    resources :discounts
  end
end
