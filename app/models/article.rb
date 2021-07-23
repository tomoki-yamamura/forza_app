class Article < ApplicationRecord
  has_many :article_category_relationships
  has_many :categories, through: :article_category_relationships

  validates :title, presence: true
  validates :body, presence: true
  attachment :image 

  # 最新を降順で３つ表示
  scope :recent_article, -> {order(created_at: :desc).limit(3)}


end
