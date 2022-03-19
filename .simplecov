# frozen_string_literal: true

SimpleCov.start :rails do
  coverage_dir 'target/coverage'

  add_filter '/spec/'
  add_filter '/db'
  add_filter '/config/'
end
