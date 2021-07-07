class Article < ApplicationRecord
  has_many :article_category_relationships, dependent: :destroy
  has_many :categories, through: :article_category_relationships

  validates :title, presence: true
  validates :body, presence: true
  attachment :image 


end
