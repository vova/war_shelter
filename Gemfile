# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.5'

gem 'activeadmin', '~> 2.10.1'
gem 'activeadmin_addons', '~> 1.8.3'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise', '~> 4.8.1'
gem 'font-awesome-rails'
gem 'jbuilder', '~> 2.7'
gem 'kaminari', '~> 1.2.2'
gem 'paper_trail'
gem 'pg', '~> 1.1'
gem 'pg_search', '~> 2.3.6'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4', '>= 6.1.4.4'
gem 'redcarpet'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'brakeman', '~> 5.2'
  gem 'bundler-audit', require: false
  gem 'bundler-leak', '~> 0.2'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'ffaker', '~> 2.20'
  gem 'lefthook', '~> 0.7'
  gem 'pry', '~> 0.13'
  gem 'pry-byebug', '~> 3.9'
  gem 'pry-doc', '~> 1.1'
  gem 'pry-rails', '~> 0.3'
  gem 'rspec-rails', '~> 5.1.0'
  gem 'rubocop', '~> 1.25'
  gem 'rubocop-performance', '~> 1.13'
  gem 'rubocop-rails', '~> 2.13'
  gem 'ruby_audit', require: false
  gem 'shoulda-matchers', '~> 5.1'
  gem 'simplecov', '~> 0.21'
  gem 'strong_migrations', '~> 0.8'
  gem 'traceroute', '~> 0.8'
end

group :test do
  gem 'database_cleaner-active_record', '~> 2.0'
end

group :development do
  gem 'capistrano', '3.16.0', require: false
  gem 'capistrano-bundler', '~> 2.0.1', require: false
  gem 'capistrano-passenger', '0.2.1', require: false
  gem 'capistrano-rails', '1.6.2', require: false
  gem 'capistrano-rbenv', '2.2.0', require: false
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end
