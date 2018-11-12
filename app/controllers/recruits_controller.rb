class RecruitsController < InheritedResources::Base

  private

    def recruit_params
      params.require(:recruit).permit(:company_id, :work_type, :employee_no, :workplace, :gender, :applicable_student, :japanese_level, :english_level, :job_description, :personality_desired, :status)
    end
end

