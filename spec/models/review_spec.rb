require "rails_helper"

#Associations and Validations Testing

RSpec.describe Review, :type => :model do
        it { should belong_to :reviewer }
        it { should belong_to :user}
        it { should validate_presence_of :rating}
        it { should validate_presence_of :comment}
        it { should validate_length_of :comment}
end

