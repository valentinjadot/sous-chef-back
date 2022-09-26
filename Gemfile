source 'https://rubygems.org'
gem 'bootsnap', require: false
gem 'data_migrate'
gem 'enumerize'
gem 'jbuilder', '~> 2.7'
gem 'pg'
gem 'power-types'
gem 'power_api', '~> 2.0'
gem 'puma', '~> 5.0'
gem 'rack-cors', '~> 1.1'
gem 'rails', '~> 6.1.4', '>= 6.1.4.7'
gem 'rails-i18n'
gem 'sass-rails', '>= 6'
gem 'scout_apm'
gem 'sentry-raven'
gem 'shakapacker', '~> 6.2.0'
gem 'strong_migrations'

group :development do
  gem 'annotate', '~> 3.0'
  gem 'listen'
  gem 'spring'
end

group :production do
  gem 'heroku-stage'
  gem 'rack-timeout'
end

group :test do
  gem 'capybara'
  gem 'rspec_junit_formatter', '~> 0.4'
  gem 'shoulda-matchers', require: false
  gem 'simplecov'
  gem 'simplecov_linter_formatter', '~> 0.2'
  gem 'simplecov_text_formatter'
  gem 'webdrivers'
end

group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'guard-rspec', require: false
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-nc', require: false
  gem 'rspec-rails'
  gem 'rswag-specs'
  gem 'rubocop', '~> 1.9'
  gem 'rubocop-performance'
  gem 'rubocop-platanus'
  gem 'rubocop-rails'
  gem 'rubocop-rspec', '~> 2.2'
end

group :production, :development, :test do
  gem 'tzinfo-data'
end
