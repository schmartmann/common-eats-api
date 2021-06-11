source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'active_model_serializers', '~> 0.10.0'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'jwt'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'pundit'
gem 'rails', '~> 6.1.3', '>= 6.1.3.2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pundit-matchers'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'json_schemer'
end

group :development do
  gem 'annotate'
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'guard-rubocop'
  gem 'listen', '~> 3.3'
  gem 'rails_best_practices'
  gem 'rspec'
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
