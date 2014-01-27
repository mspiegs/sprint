class AddProjectIdToSprintblocks < ActiveRecord::Migration
  def change
    add_column :sprintblocks, :project_id, :integer
  end
end
