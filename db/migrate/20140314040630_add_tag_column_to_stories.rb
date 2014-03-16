class AddTagColumnToStories < ActiveRecord::Migration
  def change
    add_column :stories, :tag, :string
  end
end
