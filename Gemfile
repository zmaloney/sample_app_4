source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.4'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# per http://stackoverflow.com/questions/7270169/how-to-install-readline-for-rails-console
gem 'rb-readline'

group :development, :test do 
  # Use rspec 
  gem 'rspec-rails'
  #annoying content-length warning handled by adding webrick explicitly 
  # per http://stackoverflow.com/questions/7082364/what-does-warn-could-not-determine-content-length-of-response-body-mean-and-h
  gem 'webrick', '~> 1.3.1'
  gem 'annotate' #to annotate our DB files
end

group :test do 
  gem 'capybara', '1.1.2'
end 

# I took out the following group declaration as it seemed to be screwing something up. 
# group :assets do 
  # Use SCSS for stylesheets, which depends on SASS : 
  gem 'sass', '~> 3.2.15'
  # gem 'sass-rails', '~> 4.0.2'
  # gem 'sass-rails'

  #Let's use bootstrap-sass for styling, because awesome.
  gem 'bootstrap-sass'
# end 

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
