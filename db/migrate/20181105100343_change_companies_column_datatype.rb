class ChangeCompaniesColumnDatatype < ActiveRecord::Migration[5.2]
  def self.up
    change_column :companies, :foundation, :date
    change_column :companies, :vietnam_representative, :boolean
  end

  def self.down
    change_column :companies, :foundation, :string
    change_column :companies, :vietnam_representative, :string
  end
end
