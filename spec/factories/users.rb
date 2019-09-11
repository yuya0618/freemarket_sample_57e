FactoryBot.define do

  factory :user do
    nickname              {"タローサンタマリア"}
    email                 {"taro@gmail.com"}
    phone_number          {"08012345678"}
    password              {"11111111"}
    password_confirmation {"11111111"}
    firstname             {"田中"}
    firstname_kana        {"タナカ"}
    lastname              {"太郎"}
    lastname_kana         {"タロウ"}
    birth_year            {"2000"}
    birth_month           {"1"}
    birth_day             {"1"}
  end

end