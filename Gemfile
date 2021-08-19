# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

group :development do
  gem 'sinatra', '~> 2.1'
  gem 'rubocop', '~> 1.19'
  gem 'sinatra-contrib'
  gem 'http'
  gem 'rack'
  gem 'webrick'
  gem 'dotenv'
end

group :test do
  gem 'capybara', '~> 3.35'
  gem 'rspec', '~> 3.10'
  gem 'webmock'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end
