class Category < ApplicationRecord
  has_many :article_category_relationships
  has_many :articles, through: :article_category_relationships
end
