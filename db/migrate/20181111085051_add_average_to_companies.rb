class AddAverageToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :average_review, :float, default: 0.0
  end
end
