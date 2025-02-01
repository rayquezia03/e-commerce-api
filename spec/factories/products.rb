FactoryBot.define do
  factory :product do
    name {"P1"}
    price { 100 }
    section { "Categoria A" }
    stock_quantity { 10 } 
  end
end