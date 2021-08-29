FactoryBot.define do
  factory :article_category_relationship do
    association :article
    association :category
  end
end