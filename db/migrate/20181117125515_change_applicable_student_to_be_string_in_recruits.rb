class ChangeApplicableStudentToBeStringInRecruits < ActiveRecord::Migration[5.2]
  def change
      change_column :recruits, :applicable_student, :string
  end
end
