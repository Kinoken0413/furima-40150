FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password { "aaaaa1" }
    password_confirmation { password }
    last_name { person.last }
    first_name { person.first }
    last_name_kana { person.last.katakana }
    first_name_kana { person.first.katakana }
    birth_date { Faker::Date.birthday }
  end
end
