FactoryBot.define do
  factory :user do
    email { Faker::Internet.free_email }
    password = 'name404'
    password { password }
    password_confirmation { password }
    first_name { '田中' }
    last_name { '太郎' }
    first_name_reading { 'タナカ' }
    last_name_reading { 'タロウ' }
    birthday { '1963-04-10' }
  end
end