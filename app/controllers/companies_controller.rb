class CompaniesController < ApplicationController
  before_action :find_company, except: [:index, :new, :create]
  before_action :is_admin?, except: [:show, :index]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
    #@recruit = Recruit.new
    #@compensation = Compensation.new
  end

  def show
  end

  def create
    ok = false
    @company = Company.new company_params
    if @company.save
      #@recruit = Recruit.new recruit_params
      #@recruit.company_id = @company.id

      #@compensation = Compensation.new compensation_params
      #@compensation.company_id = @company.id
      #if @recruit.save && @compensation.save
        ok = true
      #end
    end

    if ok
      flash[:success] = "company created"
      redirect_to @company
    else
      respond_to do |format|
        format.html do
          flash[:danger] = "create error"
          redirect_to root_path
        end
        format.js
      end
    end
  end

  def edit
  end

  def update
    company_updated = @company.update_attributes company_params
    #recriut_updated = @recruit.update_attributes recruit_params
    #compensation_updated = @compensation.update_attributes compensation_params
    if company_updated #&& recriut_updated && compensation_updated
      flash[:success] = "company updated"
      redirect_to @company
    else
      respond_to do |format|
        format.html do
          flash[:danger] = "update error"
          redirect_to root_path
        end
        format.js
      end
    end
  end

  def destroy
    #@recruit.destroy
    #@compensation.destroy
    @company.destroy
    flash[:success] = "company deleted"
    redirect_to root_url
  end

  private
  def find_company
    @company = Company.find_by id: params[:id]
    #@recruit = Recruit.find_by company_id: params[:id]
    #@compensation = Compensation.find_by company_id: params[:id]
    return if @company #&& @recruit && @compensation
    flash[:warning] = "company not found"
    redirect_to root_path
  end

  def company_params
    params.require(:company).permit :name, :address, :representative_name,
      :representative_role, :foundation, :vietnam_representative, :business_content,
      :code_language, :work_time, :work_hour, :appeal, :other, :picture
  end

  def recruit_params
    params.require(:recruit).permit :company_id, :work_type,
      :employee_no, :work_place, :gender, :applicable_student,
      :japanese_level, :english_level, :job_description,
      :personality_desired, :status
  end

  def compensation_params
    params.require(:compensation).permit :company_id, :insurance,
      :holiday, :paid_holidays, :holidays_no, :annual_salary,
      :month_salary, :bonus, :pay_rise, :housing_allowance, 
      :commuting_allowance, :other_allowance, :retirement, :other
  end

  def is_admin?
    return if current_user && current_user.is_admin?
    flash[:warning] = "permission denied"
    redirect_to root_path
  end
end
