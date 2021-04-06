class Message < ApplicationRecord
  
  # Associations
    belongs_to :conversation
    belongs_to :user

    # Validations
    validates_presence_of :body, :conversation_id, :user_id
  
    # Method to show time of message sent
    def message_time
      created_at.strftime("%d/%m/%y at %l:%M %p")
    end
    # Method to show time of message viewed
    def mark_as_read
      read_at.strftime("%d/%m/%y at %l:%M %p")
    end
end
