# frozen_string_literal: true

require 'simplecov'

SimpleCov.start do
  coverage_dir 'target/coverage'

  add_filter %w[spec db config]
end
