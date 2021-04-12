# Installing Capybara:

# 0. Check spec/support dir is auto-required in spec/rails_helper.rb.
#
# 1. Add these to your Gemfile:
#
# group :development, :test do
#  gem 'capybara'
#  gem 'selenium-webdriver' # For Firefox
#  # gem 'chromedriver-helper' # Install to use Chrome in feature specs
# end
#
# 2. Create a file like this one you're reading in spec/support/capybara.rb:

require 'capybara/rails'
require 'capybara/rspec'
RSpec.configure do |config|
    config.use_transactional_fixtures = false
  
    config.before(:suite) do
      if config.use_transactional_fixtures?
        raise(<<-MSG)
          Delete line `config.use_transactional_fixtures = true` from rails_helper.rb
          (or set it to false) to prevent uncommitted transactions being used in
          JavaScript-dependent specs.
  
          During testing, the app-under-test that the browser driver connects to
          uses a different database connection to the database connection used by
          the spec. The app's database connection would not be able to access
          uncommitted transaction data setup over the spec's database connection.
        MSG
      end
      DatabaseCleaner.clean_with(:truncation)
    end
  
    config.before(:each) do
      DatabaseCleaner.strategy = :transaction
    end
  
    config.before(:each, type: :feature) do
      # :rack_test driver's Rack app under test shares database connection
      # with the specs, so continue to use transaction strategy for speed.
      driver_shares_db_connection_with_specs = Capybara.current_driver == :rack_test
  
      unless driver_shares_db_connection_with_specs
        # Driver is probably for an external browser with an app
        # under test that does *not* share a database connection with the
        # specs, so use truncation strategy.
        DatabaseCleaner.strategy = :truncation
      end
    end
  
    config.before(:each) do
      DatabaseCleaner.start
    end
  
    config.append_after(:each) do
      DatabaseCleaner.clean
    end
  
  end

# By default Capybara will use Selenium+Firefox for `js:true` feature specs.
# Only if you're not using Puffing Billy, to use Chrome instead of Firefox,
# uncomment the following 3 lines:
# Capybara.register_driver :selenium do |app|
#   Capybara::Selenium::Driver.new(app, :browser => :chrome)
# end

# 3. Start using Capybara. See feature specs in this project for examples.

# Suggested docs
# --------------
# http://www.rubydoc.info/github/jnicklas/capybara/master
# Cheatsheet: https://gist.github.com/zhengjia/428105
# Capybara matchers: http://www.rubydoc.info/github/jnicklas/capybara/master/Capybara/Node/Matchers