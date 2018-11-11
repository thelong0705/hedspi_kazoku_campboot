class RepliesController < ApplicationController
  skip_forgery_protection
  respond_to :js, :json, :html
  before_action :find_comment
  before_action :find_reply, only: [:show, :update, :destroy]

  def index
    response = {data: @comment.replies}
    render json: response, status: :ok
  end

  def show
    response = {data: @reply}
    render json: response, status: :ok
  end

  def create
    @reply = Reply.new(reply_params)
    @reply.user_id = params[:user_id]
    @reply.comment_id = @comment.id
    if @reply.save
      response = {data: @reply}
      render json: response, status: :ok
    else
      response = {message: "Can't create reply"}
      render json: response, status: :unprocessable_entity
    end
  end

  def update
    if @reply.update(reply_params)
      response = {data: @reply}
      render json: response, status: :ok
    else
      response = {message: "Can't update reply"}
      render json: response, status: :unprocessable_entity
    end
  end

  def destroy
    @reply.destroy
    response = {data: @reply}
    render json: response, status: :ok
  end

  private

  def find_reply
    @reply = Reply.find(params[:id])
  end

  def find_comment
    @comment = Comment.find(params[:comment_id])
  end

  def reply_params
    params.require(:reply).permit(:content)
  end
end
