class AddYearAndDepartmentToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :year, :integer
    add_column :reviews, :department, :string
  end
end
