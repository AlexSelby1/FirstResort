ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class CarrierWave::Mount::Mounter
  def store!
    # Not storing uploads in the tests
  end
end

class ActiveSupport::TestCase

include Devise::Test::IntegrationHelpers
include Warden::Test::Helpers
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors, with: :threads)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def log_in(user)
    if integration_test?
      login_as(user, :scope => :user)
    else
      sign_in(user)
    end
  end
  
  module FixtureFileHelpers
    def file_sha(path)
      Digest::SHA2.hexdigest(File.read(Rails.root.join('test/fixtures', path)))
    end
    def encrypted_password(password = 'password123')
      User.new.send(:password_digest, password)
    end
  end


end
