class TaskList < ApplicationRecord
  belongs_to :user
  has_many :todos, dependent: :destroy
  has_many :share_tasks, dependent: :destroy
end
