class ShareTask < ApplicationRecord
  belongs_to :user
  belongs_to :task_list
  validates :user_id, :uniqueness => {:scope => [:task_list_id]}

  validate :owner_check

  def owner_check
    errors.add(:user_id, "Can't share to task owner.") if (self.task_list_id.present? && self.task_list.user_id == self.user_id)
  end
end
