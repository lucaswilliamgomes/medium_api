class AddSubtitleToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :subtitle, :text
  end
end
