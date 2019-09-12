FactoryBot.define do

  factory :item do

    name                  {"Supremeパーカー"}
    price                 {"5000"}
    details                {"使用予定なしのため出品します"}
    condition             {"新品、未使用"}
    delivery_fee          {"送料込み(出品者負担)"}
    delivery_method       {"ゆうメール"}
    delivery_location     {"北海道"}
    delivery_term         {"1~2日で発送"}
    user_id               {"1"}
    category_id           {"レディース"}
    size_id               {"S"}
    brand_id              {"3"}

  end
end