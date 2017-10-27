require 'factory_girl'

FactoryGirl.define do
  
  factory :user do
    email "ops@moip.com.br"
    name "Test User"
    password "please123"
    provider "123xyz"
    uid "321"

    association :role, factory: :role
  end

  factory :invalid_user, parent: :user do
    email nil
  end
end