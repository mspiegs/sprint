class AddSprintBlockToStories < ActiveRecord::Migration
  def change
    add_column :stories, :sprintblock_id, :integer
  end
end
