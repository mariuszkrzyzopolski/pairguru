FactoryBot.define do
  factory :comment do
    body { "MyText" }
    user
    movie
  end
end
