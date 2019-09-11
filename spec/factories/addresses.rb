FactoryBot.define do

  factory :address do
    zip_code           {"1234567"}
    address_city       {"日野市万願寺"}
    address_number     {"1-15"}
    building           {"ライオンズ万願寺"}
    user_id            {"1"}
    prefecture_id      {"20"}

    user
  end
end