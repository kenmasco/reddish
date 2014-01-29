# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :story do
    title "A great story"
    link "http://#"
    user_id 1
  end
end
