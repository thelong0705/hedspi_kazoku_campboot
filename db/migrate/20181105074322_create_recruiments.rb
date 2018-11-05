class CreateRecruiments < ActiveRecord::Migration[5.2]
  def change
    create_table :recruiments do |t|
      t.string :content
      t.string :job_category
      t.integer :company_id
      t.integer :number_of_people
      t.integer :employed
      t.string :work_location
      t.string :applicable_student
      t.string :english_required
      t.string :personality_desered
      t.string :sex

      t.timestamps
    end
  end
end
