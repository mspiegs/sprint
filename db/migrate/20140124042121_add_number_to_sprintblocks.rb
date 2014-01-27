class AddNumberToSprintblocks < ActiveRecord::Migration
  def change
    add_column :sprintblocks, :number, :integer
  end
end
