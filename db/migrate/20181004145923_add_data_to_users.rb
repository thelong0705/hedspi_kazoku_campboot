class AddDataToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :picture, :string
    add_column :users, :gender, :integer
    add_column :users, :company, :string
    add_column :users, :school_year, :integer
  end
end
