FactoryBot.define do

  factory :user do
    last_name                {"田中"}
    first_name               {"一郎"}
    nickname                 {"tana"}
    last_name_kana           {"タナカ"}
    first_name_kana          {"イチロウ"}
    birthday                 {"1931-04-04"}
    email                    {"aaa@aaa"}
    password                 {"aaaa1111"}
    password_confirmation    {"aaaa1111"}
  end

end