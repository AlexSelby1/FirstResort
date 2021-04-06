class ConversationsController < ApplicationController
    before_action :authenticate_user!
  # GET /conversations 
    def index
      @conversations = Conversation.all.includes(:messages)
    end

  # GET /conversations/new
    def new
      if Conversation.between(params[:sender_id], params[:recipient_id]).present?
        @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
      else
        @conversation = Conversation.create!(conversation_params)
      end
      redirect_to conversation_messages_path(@conversation)
    end

  # POST /conversations
    def create
      if Conversation.between(params[:sender_id], params[:recipient_id]).present?
        @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
      else
        @conversation = Conversation.create!(conversation_params)
      end
      redirect_to conversation_messages_path(@conversation)
    end
     # Only allow a list of trusted parameters through.
    private
      def conversation_params
        params.permit(:sender_id, :recipient_id)
      end
end