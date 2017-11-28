FactoryBot.define do
  factory :task_list do
    name {Faker::Name.name}
  end
end