require 'rubygems'
require 'puppetlabs_spec_helper/module_spec_helper'

RSpec.configure do |config|
  config.mock_framework = :rspec

  config.mock_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
  config.hiera_config = File.expand_path(File.join(__FILE__, '../fixtures/hiera.yaml'))
end
