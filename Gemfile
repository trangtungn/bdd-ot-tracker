source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.6'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise'
gem 'administrate'
gem 'pundit'
gem 'puma-status'
gem 'kaminari'
gem 'active_model_serializers'

group :development, :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'dotenv-rails'
  gem 'brakeman'
  gem 'factory_bot_rails'
  gem 'faker', '~> 3.1.1'
  gem 'pry-byebug', '~> 3.9'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rspec-rails'
  gem 'rubocop', '~> 1.20'
  gem 'rubocop-rails'
  gem 'rubocop-performance'
  gem 'rubocop-rspec'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0', require: false
  gem 'memory_profiler'
  gem 'stackprof'
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'overcommit'
  gem 'solargraph'
end

group :test do
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'simplecov_json_formatter', require: false
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
