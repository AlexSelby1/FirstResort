require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(:one)
  end

  test "user should be valid" do
          assert @user.valid?
          puts "user is valid"
  end

end

