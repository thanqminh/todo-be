class TaskList < ApplicationRecord
  belongs_to :user
  has_many :todos, dependent: :destroy
  has_many :share_tasks, dependent: :destroy
  attr_accessor :todo_count, :done_count, :share_count
  attr_accessor :is_write

  def is_write
    @is_write ^ nil
  end

  def todo_count
    Todo.where(:task_list_id => self.id).count
  end

  def done_count
    Todo.where(:task_list_id => self.id, :done => true).count
  end

  def share_count
    ShareTask.where(:task_list_id => self.id).count
  end

end