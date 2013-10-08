# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message_receiver do
    message nil
    user nil
  end
end
