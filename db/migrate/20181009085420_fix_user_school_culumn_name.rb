class FixUserSchoolCulumnName < ActiveRecord::Migration[5.2]
  def self.up
    rename_column :users, :company, :school
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
