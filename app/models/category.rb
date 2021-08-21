class Category < ApplicationRecord
  has_many :article_category_relationships
  has_many :articles, through: :article_category_relationships

  has_one_attached :image  # サムネイル画像を用いる為記載

end
