FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Alphanumeric.alphanumeric(number: 6) + 'Aa1'}
    password_confirmation {password}
    first_name            {'test'}
    last_name             {'test'}
    first_name_kana       {'test'}
    last_name_kana        {'test'}
    birth_day             { Date.today }
  end
end