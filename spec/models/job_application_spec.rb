require "rails_helper"

#Associations and Validations Testing

RSpec.describe JobApplication, :type => :model do
        it { should belong_to(:job) }
        it { should belong_to(:applicant) }
end