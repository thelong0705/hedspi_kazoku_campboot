class CreateRecruits < ActiveRecord::Migration[5.2]
  def change
    create_table :recruits do |t|
      t.integer :company_id
      t.string :work_type
      t.integer :employee_no
      t.text :work_place
      t.boolean :gender
      t.text :applicable_student
      t.string :japanese_level
      t.string :english_level
      t.text :job_description
      t.string :personality_desired
      t.string :status

      t.timestamps
    end
  end
end
