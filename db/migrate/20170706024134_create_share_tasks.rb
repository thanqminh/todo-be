class CreateShareTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :share_tasks do |t|
      t.references :user, foreign_key: true
      t.references :task_list, foreign_key: true
      t.boolean :is_write

      t.timestamps
    end
  end
end
