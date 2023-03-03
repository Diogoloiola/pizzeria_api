namespace :sales, defaults: { format: :json } do
  namespace :v1 do
    resources :sellers
  end
end
