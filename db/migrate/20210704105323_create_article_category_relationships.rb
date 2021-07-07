class CreateArticleCategoryRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :article_category_relationships do |t|
      t.integer :article_id
      t.integer :category_id

      t.timestamps
    end
  end
end
