Rails.application.routes.draw do
  draw :sales
  mount_devise_token_auth_for 'Seller', at: 'auth'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
