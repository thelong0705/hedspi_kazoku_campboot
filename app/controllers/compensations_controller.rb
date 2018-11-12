class CompensationsController < InheritedResources::Base

  private

    def compensation_params
      params.require(:compensation).permit(:company_id, :insurance, :holiday, :paid_holidays, :holidays_no, :annual_salary, :month_salary, :bonus, :pay_rise, :housing_allowance, :other_allowance, :commuting_allowance, :retirement, :other)
    end
end

