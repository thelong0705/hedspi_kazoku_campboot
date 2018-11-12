class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy like]
  #before_action :find_result, only: :index
  
  respond_to :js, :json, :html
  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.paginate(:page => params[:page], :per_page => 9).order('name ASC')
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @comments = @company.comments
    if user_signed_in?
      @cur_review = Review.find_by user_id:current_user.id, company_id:@company.id
    end
  end

  def like
    if !current_user.liked? @company
      @company.liked_by current_user
    elsif current_user.liked? @company
      @company.unliked_by current_user
    end
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html {redirect_to @company, notice: 'Company was successfully created.'}
        format.json {render :show, status: :created, location: @company}
      else
        format.html {render :new}
        format.json {render json: @company.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html {redirect_to @company, notice: 'Company was successfully updated.'}
        format.json {render :show, status: :ok, location: @company}
      else
        format.html {render :edit}
        format.json {render json: @company.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html {redirect_to companies_url, notice: 'Company was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  def search
    if params[:search].present?
      @q = Company.ransack(name_or_address_or_code_language_cont: params[:search])
      @companies = @q.result
      respond_to do |format|
        format.html
        format.js do
          render json: {results: @companies, status: 200}
        end
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def company_params
    params.require(:company).permit(:name, :address, :representative_name,
                                    :representative_role, :foundation, :vietnam_representative,
                                    :business_content, :code_language, :work_time, :work_hour,
                                    :appeal, :other, :picture)
  end
end
