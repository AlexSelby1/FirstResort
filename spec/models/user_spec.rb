require "rails_helper"

#Associations and Validations Testing

    RSpec.describe User, type: :model do
      it { should validate_presence_of :name }
      it { should validate_uniqueness_of(:email).case_insensitive }
      it { should validate_presence_of :password }
      it { should validate_length_of :password }
      it { should have_many :jobs}
      it { should have_many :job_applications}
      it { should have_many :reviews}
    end