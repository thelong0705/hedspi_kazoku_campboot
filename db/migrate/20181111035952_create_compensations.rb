class CreateCompensations < ActiveRecord::Migration[5.2]
  def change
    create_table :compensations do |t|
      t.integer :company_id
      t.string :insurance
      t.string :holiday
      t.string :paid_holidays
      t.integer :holidays_no
      t.string :annual_salary
      t.string :month_salary
      t.string :bonus
      t.string :pay_rise
      t.string :housing_allowance
      t.string :other_allowance
      t.string :commuting_allowance
      t.string :retirement
      t.string :other

      t.timestamps
    end
  end
end
