class ReviewsController < ApplicationController
  skip_forgery_protection
  before_action :find_company
  before_action :find_review, only: [:show, :update, :destroy]
  respond_to :js, :json, :html

  def index
    response = {average: @company.reviews.average(:rating), data: @company.reviews}
    render json: response, status: :ok
  end

  def show
    response = {average: @company.reviews.average(:rating), data: @review}
    render json: response, status: :ok
  end

  def create
    @review = nil
    @company.reviews.each do |r|
      if r.user_id.to_s == params[:user_id]
        puts "true"
        @review = r
        break
      end
    end
    if @review.nil?
      @review = Review.new(review_params)
      @review.company_id = @company.id
      @review.user_id = params[:user_id]
      if @review.save
        @company.update_attribute(:average_review, @company.reviews.average(:rating))
        response = {average: @company.reviews.average(:rating), data: @review}
        render json: response, status: :ok
      else
        response = {message: "Can't create review"}
        render json: response, status: :unprocessable_entity
      end
    else
      if @review.update(review_params)
        @company.update_attribute(:average_review, @company.reviews.average(:rating))
        response = {average: @company.reviews.average(:rating), data: @review}
        render json: response, status: :ok
      else
        response = {message: "Can't update review"}
        render json: response, status: :unprocessable_entity
      end
    end
  end

  def update
    if @review.update(review_params)
      @company.update_attribute(:average_review, @company.reviews.average(:rating))
      response = {average: @company.reviews.average(:rating), data: @review}
      render json: response, status: :ok
    else
      response = {message: "Can't update review"}
      render json: response, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    @company.update_attribute(:average_review, @company.reviews.average(:rating))
    response = {average: @company.reviews.average(:rating), data: @review}
    render json: response, status: :ok
  end

  private

  def review_params
    params.require(:review).permit(:rating)
  end

  def find_company
    @company = Company.find(params[:company_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
