class Recruit < ApplicationRecord
  belongs_to :company
  
  validates_presence_of :company_id, :work_type, :employee_no, :workplace, :applicable_student,
    :job_description, :personality_desired
end
