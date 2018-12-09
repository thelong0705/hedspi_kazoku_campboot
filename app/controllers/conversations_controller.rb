class ConversationsController < ApplicationController
  def create
    @conversation = Conversation.get(current_user.id, params[:user_id])

    add_to_conversations(@conversation) unless conversated?(@conversation)

    respond_to(&:js)
  end

  def close
    @conversation = Conversation.find(params[:id])

    session[:conversations].delete(@conversation.id)

    respond_to(&:js)
  end

  private

  def add_to_conversations(conversation)
    session[:conversations] ||= []
    session[:conversations] << conversation.id
  end

  def conversated?(conversation)
    session[:conversations].include?(conversation.id)
  end
end
