require "rails_helper"

RSpec.describe JobApplication, :type => :model do
  
    @jobapp1 = let(:user) { create(:job_application)}

    
    it "is not a valid title" do
    jobapp2 = build(:job_application, title: nil)
      expect(jobapp2).to_not be_valid
    end
    it "is a valid title" do
        jobapp2 = build(:job_application, title: "Barista wanted")
          expect(jobapp2).to be_valid
    end

    it "is not a valid description" do
        jobapp2 = build(:job_application, description: nil)
          expect(jobapp2).to_not be_valid
    end
    it "is a valid description" do
        jobapp2 = build(:job_application, description: "We are looking for a barista for our newly hotel")
           expect(jobapp2).to be_valid
    end
end
