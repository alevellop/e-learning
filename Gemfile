source 'https://rubygems.org'

ruby "1.9.3"
#ruby-gemset=e-learning

gem 'rails', '3.2.13'

gem 'devise'

group :development do
	gem 'mongoid', '~> 3.0.0'
	gem "bson_ext"
end

gem 'mongoid-paperclip', :require => "mongoid_paperclip"


# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3', "~> 1.3.7",:group => [:development, :test]

# Gems used only for assets and not required
# in production environments by default.

gem 'sass-rails',   '~> 3.2.3'
gem 'coffee-rails', '~> 3.2.1'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', :platforms => :ruby

gem 'uglifier', '>= 1.0.3'
gem 'foundation-rails'


gem 'haml'

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'
gem 'jbuilder'
gem 'turbolinks'
gem 'thin'
# Use unicorn as the app server
group :production do
	gem 'pg'
	gem 'rails_12factor'
end

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
