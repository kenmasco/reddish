# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "w@3.com"
    password "12345678"
    id 1
  end
end
