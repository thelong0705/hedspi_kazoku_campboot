class CreateTreatments < ActiveRecord::Migration[5.2]
  def change
    create_table :treatments do |t|
      t.string :content
      t.boolean :social_insurance
      t.integer :integer
      t.string :welfare
      t.integer :company_id
      t.integer :annual_income

      t.timestamps
    end
  end
end
