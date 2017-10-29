source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.4'
gem 'puma', '~> 3.7'
gem 'active_model_serializers', '~> 0.10.0'
gem 'pg', '~> 0.18.2'

# auth
gem 'knock'
gem 'bcrypt', '~> 3.1.7'

# front-end
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'
gem 'haml-rails'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'

# workers
gem 'redis', '~> 3.0'
gem 'sidekiq'

# file upload
gem 'aws-sdk', '~> 2.3'
gem 'shrine'

# cors
gem 'rack-cors'

# monitoring
gem 'bugsnag'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails', '~> 3.5.0'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'shrine-memory'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'mailcatcher', require: false
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
end

# windows
gem 'tzinfo-data', '~> 1.2017', '>= 1.2017.2'
