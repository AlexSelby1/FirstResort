class MessagesController < ApplicationController
    before_action :find_conversation
    # GET conversations/1/messages
    def index
        @messages = @conversation.messages
        if @messages.length > 10
          @over_ten = true
          @messages = @messages[-10..-1]
        end
        if params[:m]
          @over_ten = false
          @messages = @conversation.messages
        end
        if @messages.last
          if @messages.last.user_id != current_user.id
           @messages.last.read_at = Time.now
           @messages.last.save
          end
        end
        @message = @conversation.messages.new
    end
    # GET conversations/1/message
    def new
      @message = @conversation.messages.new
    end
  
     # POST conversations/1/message
      def create
        @message = @conversation.messages.new(message_params)
        if @message.save
          redirect_to conversation_messages_path(@conversation)
        end
      end
    
      private
      # Only allow a list of trusted parameters through.
        def message_params
          params.require(:message).permit(:body, :user_id, :read_at)
        end
      # Find conversation between recipient and sender
        def find_conversation
          @conversation = Conversation.find(params[:conversation_id])
        end
end