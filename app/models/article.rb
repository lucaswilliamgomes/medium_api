class Article < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_rich_text :body
  has_one_attached :cover

  validates :title, presence: true
  validates :body, presence: true
  validates :reading_time, presence: true
  validates :cover, presence: true

  def get_cover_url
    url_for(self.cover)
  end
end
