class MessagesController < ApplicationController
  def create
    @conversation = Conversation.includes(:recipient).find(params[:conversation_id])
    @message = @conversation.messages.create(message_params)
    if @message
      ActionCable.server.broadcast 'messages',
        message: @message.body,
        user: @message.user,
        conversation: @message.conversation
      head :ok
    end
 
    respond_to do |format|
      format.js
    end
  end
 
  private
 
  def message_params
    params.require(:message).permit(:user_id, :body)
  end
end
