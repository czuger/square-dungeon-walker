FactoryBot.define do
  factory :user do

    provider :google_oauth2

    sequence :uid do |n|
      n
    end

    sequence :name do |n|
      "username #{n}"
    end

    sequence :email do |n|
      "username#{n}@example.com"
    end

  end
end
