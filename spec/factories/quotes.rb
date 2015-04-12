FactoryGirl.define do
  factory :quote do
    author
    content Faker::Hacker.say_something_smart
  end
end
