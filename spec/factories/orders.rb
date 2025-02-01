FactoryBot.define do
    factory :order do
      total { 100.0 }
      status { "pending" }
      association :user
      association :cart
    end
end  