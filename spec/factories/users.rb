FactoryBot.define do
    factory :user do
        user {Faker::Name.name}
        email {'mohdhaider30@gmail.com'}
        password {'iamawesome'}
    end
end