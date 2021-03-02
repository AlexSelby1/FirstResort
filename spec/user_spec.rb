require "rails_helper"

RSpec.describe User, :type => :model do
    before(:all) do
      @user1 = create(:user)
    end
    
    it "is valid with valid attributes" do
      expect(@user1).to be_valid
    end
    
    it "has a unique email" do
      user2 = build(:user, email: "alex@gmail.com")
      expect(user2).to be_valid
    end
    
    it "has a unique name" do
      user2 = build(:user, name: "Bob")
      expect(user2).to_not be_valid
    end
    
    it "is not valid without a password" do 
      user2 = build(:user, password: nil)
      expect(user2).to_not be_valid
    end
    
    it "is not valid without a name" do 
      user2 = build(:user, name: nil)
      expect(user2).to_not be_valid
    end
    
    it "is not valid without an email" do
      user2 = build(:user, email: nil)
      expect(user2).to_not be_valid
    end

    it "has password sufficient" do
      expect(@user1).to be_valid
    end

    it "has password too short" do
      user2 = build(:user, password: "blah")
      expect(user2).to_not be_valid
    end
end