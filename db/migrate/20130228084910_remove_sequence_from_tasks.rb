class RemoveSequenceFromTasks < ActiveRecord::Migration
  def up
  	remove_column :tasks, :sequence, :integer
  end

  def down
  end
end
