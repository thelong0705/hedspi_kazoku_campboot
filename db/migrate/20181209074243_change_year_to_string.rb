class ChangeYearToString < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :year_begin, :integer
    add_column :reviews, :year_end, :integer
  end
end
