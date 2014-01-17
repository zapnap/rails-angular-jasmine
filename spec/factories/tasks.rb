FactoryGirl.define do
  factory :task do
    sequence(:name) { |n| "Task #{n}" }
  end
end
