class CommentsController < ApplicationController
  skip_forgery_protection
  before_action :find_company
  before_action :find_comment, only: [:destroy, :edit, :update, :comment_owner]
  before_action :comment_owner, only: [:destroy, :edit, :update]

  def create
    @comment = @company.comments.new(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    @comment.save!
    respond_to do |format|
      format.html {redirect_to @company}
      format.js
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html {redirect_to @company}
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    @comments = Comment.where(company_id: @company)
    @comment.update(params[:comment].permit(:content))
    respond_to do |format|
      format.html {redirect_to @company}
      format.js
    end
  end

  private

  def find_company
    @company = Company.find(params[:company_id])
  end

  def find_comment
    @comment = @company.comments.find(params[:id])
  end

  def comment_owner
    unless current_user && current_user.id == @comment.user_id
      flash[:notice] = "You dont have permission to perform this action"
      redirect_to @company
    end
  end
end
