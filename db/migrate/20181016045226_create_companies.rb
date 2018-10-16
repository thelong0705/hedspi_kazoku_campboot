class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :representative_name
      t.string :representative_role
      t.string :foundation
      t.string :vietnam_representative
      t.string :business_content
      t.string :code_language
      t.string :work_time
      t.string :work_hour
      t.string :appeal
      t.string :other
      t.string :picture

      t.timestamps
    end
  end
end
