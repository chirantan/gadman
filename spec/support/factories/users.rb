FactoryGirl.define do
  factory :user do
    email "thomas.anderson@matrix.com"
    confirmed_at 3.days.ago
    password "mynameisneo"
  end
end