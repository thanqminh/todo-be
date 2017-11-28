FactoryBot.define do
  factory :todo do
    name {Faker::Name.name}
    done {[true, false].sample}
  end
end