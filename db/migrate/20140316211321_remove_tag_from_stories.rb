class RemoveTagFromStories < ActiveRecord::Migration
  def change
    remove_column :stories, :tag, :string
  end
end
