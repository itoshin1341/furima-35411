FactoryBot.define do
  factory :user do
    nickname { 'やまたろ' }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_kana { 'アイウエオ' }
    first_name_kana { 'アイウエオ' }
    email { Faker::Internet.free_email }
    password { 'nice1234' }
    password_confirmation { password }
    birthday { Faker::Date.birthday }
  end
end
