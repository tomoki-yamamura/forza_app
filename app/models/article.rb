class Article < ApplicationRecord
  has_many :article_category_relationships
  has_many :categories, through: :article_category_relationships
  has_rich_text :body
  has_one_attached :image  # サムネイル画像を用いる為記載

  validates :title, presence: true
  validates :body, presence: true
  # カテゴリー１つ以上
  validates :category_ids, length: { in: 1..3 }

  scope :recent_article, -> { limit(5).order(created_at: :desc) }

  scope :from_category, -> (category_id)  { where(id: article_ids = ArticleCategoryRelationship.where(category_id: category_id).select(:article_id)).order(created_at: :desc)}
end
