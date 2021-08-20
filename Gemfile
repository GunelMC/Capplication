# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

group :development do
  gem 'dotenv'
  gem 'http'
  gem 'rack'
  gem 'rubocop', '~> 1.19'
  gem 'sinatra', '~> 2.1'
  gem 'sinatra-contrib'
  gem 'webrick'
end

group :test do
  gem 'capybara', '~> 3.35'
  gem 'rspec', '~> 3.10'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem 'webmock'
end
