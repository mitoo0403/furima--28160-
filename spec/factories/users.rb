FactoryBot.define do
  factory :user do
    nickname              {'mitoo'}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {'美藤'}
    last_name             {'寛之'}
    first_name_kana       {'ミトウ'}
    last_name_kana        {'ヒロユキ'}
    birthday              {19821113}
  end
end