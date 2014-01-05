class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.string :audience
      t.string :want
      t.string :because
      t.string :estimate
      t.integer :value

      t.timestamps
    end
  end
end
