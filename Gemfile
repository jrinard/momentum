source 'https://rubygems.org'

gem 'rails', '~> 5.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'devise'
gem 'paperclip', '~> 4.1'
gem 'rest-client', '>= 2.0'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'acts_as_votable', '~> 0.10.0'
gem 'aws-sdk', '< 2.0' # online storage
gem 'httparty'
gem 'textacular'
gem 'will_paginate', '~> 3.1.0'
gem "chartkick" # charts http://chartkick.com/
gem 'groupdate' # for charts https://github.com/ankane/groupdate
gem 'chosen-rails' # for fancy select form field


group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'launchy'
  gem 'pry'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'simplecov', require: false
  gem "phantomjs"
  gem "poltergeist"
  gem 'database_cleaner'
  gem 'dotenv-rails' #for env auth
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem "vcr" #speeds up api testing
  gem "webmock" #speeds up api testing
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

require 'rbconfig'
  if RbConfig::CONFIG['target_os'] =~ /darwin(1[0-3])/i
    gem 'rb-fsevent', '<= 0.9.4'
  end
