# frozen_string_literal: true

class ReviewsController < ApplicationController
  skip_forgery_protection
  before_action :find_company
  before_action :find_review, only: %i[show update destroy]
  respond_to :js, :json, :html

  def index
    response = { average: @company.reviews.average(:rating), data: @company.reviews }
    render json: response, status: :ok
  end

  def show
    response = { average: @company.reviews.average(:rating), data: @review }
    render json: response, status: :ok
  end

  def create
    @review = nil
    @company.reviews.each do |r|
      next unless r.user_id.to_s == params[:user_id]

      @review = r
      break
    end

    if @review.nil?
      array = []
      @user = User.find(params[:user_id])
      @user.reviews.each do |r|
        hash = { :year_begin => r.year_begin, :year_end => r.year_end }
        array.push(hash)
      end
      array.each do |item|
        if item[:year_begin] < params[:year_begin].to_i && params[:year_begin].to_i < item[:year_end]
          response = { message: "Wrong year begin" }
          render json: response, status: :unprocessable_entity
          return
        end

        if item[:year_begin] < params[:year_end].to_i && params[:year_end].to_i < item[:year_end]
          response = { message: "Wrong year end" }
          render json: response, status: :unprocessable_entity
          return
        end
      end

      @review = Review.new(review_params)
      @review.company_id = @company.id
      @review.user_id = params[:user_id]
      if @review.save
        @company.update_attribute(:average_review, @company.reviews.average(:rating))
        response = { average: @company.reviews.average(:rating).round(1), data: @review, review: { "5": @company.reviews.star(5).count,
                                                                                                   "4": @company.reviews.star(4).count, "3": @company.reviews.star(3).count, "2": @company.reviews.star(2).count, "1": @company.reviews.star(1).count },
                     count: @company.reviews.count }
        render json: response, status: :ok
      else
        response = { message: "Can't create review" }
        render json: response, status: :unprocessable_entity
      end
    else
      if @review.update(review_params)
        @company.update_attribute(:average_review, @company.reviews.average(:rating))
        response = { average: @company.reviews.average(:rating).round(1), data: @review, review: { "5": @company.reviews.star(5).count,
                                                                                                   "4": @company.reviews.star(4).count, "3": @company.reviews.star(3).count, "2": @company.reviews.star(2).count, "1": @company.reviews.star(1).count },
                     count: @company.reviews.count }
        render json: response, status: :ok
      else
        response = { message: "Can't update review" }
        render json: response, status: :unprocessable_entity
      end
    end
  end

  def update
    if @review.update(review_params)
      @company.update_attribute(:average_review, @company.reviews.average(:rating))
      response = { average: @company.reviews.average(:rating), data: @review }
      render json: response, status: :ok
    else
      response = { message: "Can't update review" }
      render json: response, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    avg = @company.reviews.average(:rating)
    avg ||= 0
    @company.update_attribute(:average_review, avg)
    response = { average: avg, review: { "5": @company.reviews.star(5).count,
                                         "4": @company.reviews.star(4).count,
                                         "3": @company.reviews.star(3).count,
                                         "2": @company.reviews.star(2).count,
                                         "1": @company.reviews.star(1).count },
                 count: @company.reviews.count }
    render json: response, status: :ok
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :year_begin, :year_end, :company, :department)
  end

  def find_company
    @company = Company.find(params[:company_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
