$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'database_cleaner'
require 'byebug'
require 'securerandom'
require 'rspec'

RSpec.configure do |config|
  
  config.include RSpec::Rails::Mocks
  
  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

end