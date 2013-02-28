class AddProjectIdAndSequenceToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :project_id, :integer
    add_column :tasks, :sequence, :integer
    add_index :tasks, :project_id
    add_index :tasks, :sequence
    add_index :tasks, :created_at
  end
end
