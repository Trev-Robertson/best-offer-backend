class AddTaskDoneToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :task_done, :boolean, default: false
  end
end
