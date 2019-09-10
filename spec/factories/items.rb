FactoryBot.define do

  factory :item do
    name                  {"Supremeパーカー"}
    price                 {"5000"}
    detail                {"使用予定なしのため出品します"}
    condition             {"1"}
    delivery_fee          {"2"}
    delivery_method       {"3"}
    delivery_location     {"2"}
    delivery_term         {"3"}
    user_id               {"1"}
    category_id           {"2"}
    size_id               {"3"}
    brand_id              {"1"}

  end
end