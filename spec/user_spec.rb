require "rails_helper"

    RSpec.describe User, :focus, type: :model do
      it { should validate_presence_of :name }
      it { should validate_presence_of :email }
      it { should validate_presence_of :password }
      it { should have_many :jobs}
    end