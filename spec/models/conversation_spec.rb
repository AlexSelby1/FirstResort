require "rails_helper"

#Associations and Validations Testing

RSpec.describe Conversation, :type => :model do
        it { should belong_to :sender }
        it { should belong_to :recipient}
        it { should have_many :messages}
end


