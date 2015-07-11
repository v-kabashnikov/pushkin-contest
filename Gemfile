source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails', '4.0.13'
gem 'pg', '~> 0.17.1'

gem 'sass-rails', '~> 4.0.1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.1'

gem 'jquery-rails'
gem 'jbuilder', '~> 1.2'
gem 'rabl'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'mechanize'
gem 'colored'
gem 'simple_form'
gem 'bootstrap-sass', '~> 3.3.3'
gem 'sinatra', '>= 1.3.0', :require => nil
gem 'sidekiq'
gem 'sidekiq-failures'
gem 'sidetiq'
gem 'pry-rails'
gem 'rest-client', '~> 1.6.7'
gem 'paper_trail', '~> 3.0.1'
gem 'retryable', '~> 1.3.5'


group :development do
  gem 'nifty-generators'
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'foreman'
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'brakeman', :require => false
  gem 'letter_opener'
  gem 'capistrano', '~> 3.4.0'
  gem 'capistrano-bundler'
  gem 'capistrano-rvm'
  gem 'capistrano-rails'
  gem 'capistrano-sidekiq'
  gem 'capistrano3-unicorn', '~> 0.2.1'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'thin'
end

group :production do
  gem 'unicorn'
  gem 'rails_12factor'
end

group :test do
  gem 'database_cleaner', '1.0.1'
  gem 'vcr'
  gem 'webmock'
  gem 'test-unit'
end
