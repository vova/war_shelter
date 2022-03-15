# frozen_string_literal: true

require 'simplecov'

SimpleCov.start :rails do
  coverage_dir 'target/coverage'

  add_filter '/spec/'
  add_filter '/db'
  add_filter '/config/'
end
