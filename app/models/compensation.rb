class Compensation < ApplicationRecord
	belongs_to :company

  validates_presence_of :company_id, :insurance, :holiday, :paid_holidays,
    :holidays_no, :annual_salary, :month_salary, :bonus, :pay_rise,
    :housing_allowance, :commuting_allowance
end
