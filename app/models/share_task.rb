class ShareTask < ApplicationRecord
  belongs_to :user
  belongs_to :task_list
  validates :id, :uniqueness => {:scope => [:user_id, :task_list_id]}
end
