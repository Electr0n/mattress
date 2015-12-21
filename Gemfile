source 'https://rubygems.org'
gem 'rails', '3.2.8'
#gem 'pg', :group => :production
gem 'jquery-rails', '< 3.0.0'
gem "thin", ">= 1.4.1"
gem "slim", ">= 1.3.0"#, :require => 'slim/logic_less'
gem 'slim-rails'
gem 'mysql2', '0.3.17'

gem 'friendly_id'

gem 'kaminari'

gem "fog", "~> 1.3.1"
gem "net-ssh", '2.6.0'

# ckeditor
gem 'ckeditor', ">=3.7.1"
gem "carrierwave"
gem "mini_magick"
# end of ckeditor dependancies

gem 'nested_form'

gem 'twitter-bootstrap-rails', '2.1.3'
gem "devise", ">= 2.1.2"
gem "simple_form", ">= 2.0.2"
gem "bootstrap-sass", "2.1.0.0"

gem 'squeel'
gem 'yaml_db'

group :development do
  gem 'capistrano' , "~> 2.13.4"
  gem 'capistrano-multistage'
  gem  'rvm-capistrano',  require: false
  gem "hpricot", ">= 0.8.6"
  gem "ruby_parser", ">= 2.3.1"
end

group :development, :test do
  gem 'sqlite3'
  gem "rspec-rails", ">= 2.11.0"
  gem "factory_girl_rails", ">= 4.0.0"
  gem 'quiet_assets'
  gem 'pry-rails'
  gem 'pry-doc'
end

group :test do
  gem "capybara", ">= 1.1.2"
  gem "capybara-webkit"
  gem 'webmock'
  gem 'launchy'
  gem 'simplecov', :require => false
end

group :assets do
  gem "therubyracer", ">= 0.10.2"
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end
