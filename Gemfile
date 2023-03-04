source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.4', '>= 7.0.4.2'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem "rack-cors"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  # gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'byebug', '~> 11.1', '>= 11.1.3'
  gem 'database_cleaner', '~> 2.0', '>= 2.0.1' # Serve para limpar a base de testes
  gem 'dotenv-rails', '~> 2.8', '>= 2.8.1'
  gem 'factory_bot_rails', '~> 6.2' # cria modelos para os teste
  gem 'faker', '~> 3.1', '>= 3.1.1' # lib para dados falsos
  gem 'rspec-rails', '~> 6.0', '>= 6.0.1' # lib para os testes
  gem 'shoulda-matchers', '~> 5.3' # ajuda nos testar os modelos
end

group :development do
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false

  gem 'lefthook', '~> 1.3'

  gem 'brakeman', '~> 5.4'
  gem 'bundler-audit', '~> 0.9.1'
end

# lograge changes Rails' logging to a more
gem 'lograge'
# traditional one-line-per-event format
gem 'cpf_cnpj', '~> 0.5.0' # lib que valida ou cria cpf/cnpj de forma dinanmica.
gem 'devise_token_auth', github: 'lynndylanhurley/devise_token_auth' # gem para autenticação dos usuáriosgem 'lograge'
