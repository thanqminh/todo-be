FactoryBot.define do
  factory :share_task do
    is_write {[true, false].sample}
  end
end