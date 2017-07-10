class TaskList < ApplicationRecord
  belongs_to :user
  has_many :todos, dependent: :destroy
  has_many :share_tasks, dependent: :destroy
  attr_accessor :is_write

  def is_write
    @is_write || nil
  end

end