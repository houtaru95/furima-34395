FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { 'test1234' }
    password_confirmation { password }
    family_name           { '田中' }
    first_name            { '太郎' }
    family_name_kana      { 'タナカ' }
    first_name_kana       { 'タロウ' }
    birth_day             { Faker::Date.backward }
  end
end
