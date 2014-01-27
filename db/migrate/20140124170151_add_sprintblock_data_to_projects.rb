class AddSprintblockDataToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :sprint_length, :integer
    add_column :projects, :start_date, :date
    add_column :projects, :start_number, :integer
  end
end
