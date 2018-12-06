class CommentsController < ApplicationController
  skip_forgery_protection
  before_action :find_comment, only: [:destroy, :update]

  def index
    response = Comment.all
    render json: response, status: :ok
  end

  def create
    @review = Review.find(params[:review_id])
    @comment = @review.comments.new(content: params[:content])
    @comment.user_id = params[:user_id]
    if @comment.save
      response = {data: @comment}
      render json: response
    else
      response = {message: "Can't create comment"}
      render json: response, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    response = {message: 'Deleted'}
    render json: response, status: :no_content
  end

  def update
    @comment.update(content: params[:content])
    response = {message: 'Updated'}
    render json: response, status: :no_content
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
  end
end
