class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :representative_name
      t.string :representative_role
      t.datetime :foundation
      t.string :vietnam_representative
      t.text :business_content
      t.string :code_language
      t.integer :work_time
      t.integer :work_hour
      t.string :appeal
      t.text :other
      t.string :picture

      t.timestamps
    end
  end
end
