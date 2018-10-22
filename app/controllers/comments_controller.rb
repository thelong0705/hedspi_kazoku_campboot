class CommentsController < ApplicationController
  before_action :find_company
  before_action :find_comment, only: [:destroy, :edit, :update, :comment_owner]
  before_action :comment_owner, only:  [:destroy, :edit, :update]

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

  end

  def update
    if @comment.update(params[:comment].permit(:content))
      redirect_to company_path(@company)
    else
      render 'edit'
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
    unless current_user.id == @comment.user_id
      flash[:notice] = "Dont try to do this"
      redirect_to @company
    end
  end
end
