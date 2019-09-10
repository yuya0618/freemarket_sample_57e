FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    phonenumber           {"00000000"}
    password              {"11111111"}
    password_confirmation {"11111111"}
    firstname             {"花子"}
    firstname_kana        {"ハナコ"}
    lastname              {"太郎"}
    lastname_kana         {"タロウ"}
    birth_year            {"2000"}
    birth_month           {"1"}
    birth_day             {"1"}
  end

end