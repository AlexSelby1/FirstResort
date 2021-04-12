require "rails_helper"

#Associations and Validations Testing

RSpec.describe Message, :type => :model do
        it { should belong_to :conversation }
        it { should belong_to :user}
        it { should validate_presence_of :body}
        it { should validate_presence_of :conversation_id}
        it { should validate_presence_of :user_id}
end


