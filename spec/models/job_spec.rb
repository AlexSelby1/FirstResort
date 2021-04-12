require "rails_helper"

#Associations and Validations Testing

RSpec.describe Job, :type => :model do
        it { should validate_presence_of :title }
        it { should validate_length_of :title }
        it { should validate_presence_of :country }
        it { should validate_length_of :description }
        it { should belong_to :user }
        it { should have_many :job_applications}
        it { should have_many :applicants}
end
