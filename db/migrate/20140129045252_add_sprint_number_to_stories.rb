class AddSprintNumberToStories < ActiveRecord::Migration
  def change
    add_column :stories, :sprint_number, :integer
  end
end
