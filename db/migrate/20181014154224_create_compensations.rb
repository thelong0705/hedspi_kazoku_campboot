class CreateCompensations < ActiveRecord::Migration[5.2]
  def change
    create_table :compensations do |t|
      t.integer :company_id
      t.string :insurance
      t.string :holiday
      t.integer :paid_holidays
      t.integer :holidays_no
      t.integer :annual_salary
      t.integer :month_salary
      t.integer :bonus
      t.integer :pay_rise
      t.string :housing_allowance
      t.string :commuting_allowance
      t.text :other_allowance
      t.string :retirement
      t.text :other

      t.timestamps
    end
  end
end
