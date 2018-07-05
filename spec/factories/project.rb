FactoryBot.define do
  factory :project do
    title       { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph(3) }
  end
end
