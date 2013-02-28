class AddTypeAndStatusToTasks < ActiveRecord::Migration
  def change
  	add_column :tasks, :type_id, :integer
  	add_column :tasks, :status_id, :integer
  end
end
