FactoryBot.define do
  factory :user do

    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    #nickname              {'test'}
    #email                 {'test@example'}
    #password              {'000000'}
    #password_confirmation {'000000'}
    family_name           {'山田'}
    family_name_kana      {'ヤマダ'}
    first_name            {'太郎'}
    first_name_kana       {'タロウ'}
    birth_day             {'2000-01-01'}
  end
end