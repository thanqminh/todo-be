class ShareTask < ApplicationRecord
  belongs_to :user
  belongs_to :task_list
  validates :user_id, :uniqueness => {:scope => [:task_list_id]}
end
