class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :task_lists
  has_many :share_tasks
  has_many :shared_task_lists, :through => :share_tasks, :source => :task_list
end
