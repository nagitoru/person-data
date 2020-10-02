FactoryBot.define do
  factory :person do
    first_name { '田中' }
    last_name { '次郎' }
    first_name_reading { 'タナカ' }
    last_name_reading { 'ジロウ' }
    birthday { '1963-04-10' }
    hobby { '野球' }
    free_space { '家族を持っている' }
    email { Faker::Internet.free_email }
    association :user
  end
end
