class AddDisplayColumnsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :backlog_display, :boolean
    add_column :projects, :committed_display, :boolean
    add_column :projects, :started_display, :boolean
    add_column :projects, :completed_display, :boolean
    add_column :projects, :accepted_display, :boolean
    add_column :projects, :qa_display, :boolean
  end
end
