class AddColumnToUsersAndProjects < ActiveRecord::Migration
  def change
  	create_table :projects_users do |t|
      t.belongs_to :user
      t.belongs_to :project
    end
  end
end
