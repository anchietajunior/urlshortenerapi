FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password 'bebaagua2019'
    password_confirmation 'bebaagua2019'
  end
end
