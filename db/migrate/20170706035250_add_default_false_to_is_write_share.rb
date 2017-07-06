class AddDefaultFalseToIsWriteShare < ActiveRecord::Migration[5.1]
  def change
    change_column :share_tasks, :is_write, :boolean, :default => false
  end
end
