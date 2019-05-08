source 'https://rubygems.org'

ruby '2.6.1'

gem 'rails', '~> 5.2.3'
gem 'sqlite3'
gem 'puma', '~> 3.11'
gem 'bcrypt', '~> 3.1.7'
gem 'devise'
gem 'jwt'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'active_model_serializers'

group :development, :test do
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails', '~> 4.8.2'
  gem 'database_cleaner'
  gem 'faker'
  gem 'shoulda-matchers'
  gem 'rails-controller-testing'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'pry-byebug'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
