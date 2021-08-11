class RemoveBodyFromArticles < ActiveRecord::Migration[6.1]
  def change
    remove_column :articles, :body, :text
    remove_column :articles, :image_id, :string
  end
end
