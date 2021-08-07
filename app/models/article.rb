class Article < ApplicationRecord
  has_many :article_category_relationships
  has_many :categories, through: :article_category_relationships

  scope :from_category, -> (category_id)  { where(id: article_ids = ArticleCategoryRelationship.where(category_id: category_id).select(:article_id))}
  

  validates :title, presence: true
  validates :body, presence: true
  attachment :image 

  # # 最新を降順で３つ表示
  scope :recent_article, -> {order(created_at: :desc).limit(3)}


end
