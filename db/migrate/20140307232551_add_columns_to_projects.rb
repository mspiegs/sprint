class AddColumnsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :duration_number, :string
    add_column :projects, :duration_length, :string
  end
end
