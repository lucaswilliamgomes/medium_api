class Article < ApplicationRecord
  has_rich_text :body
  validates :title, presence: true
  validates :body, presence: true
  validates :reading_time, presence: true
end
