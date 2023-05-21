class Article < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_rich_text :body
  has_one_attached :cover
  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, presence: true
  validates :body, presence: true
  validates :reading_time, presence: true
  validates :cover, presence: true
  validates :tags, presence: true

  def self.cover_url
    url_for(cover)
  end

  def self.tagged_with(name)
    Tag.find_by!(name:).articles
  end

  def self.tag_counts
    Tag.select('tags.*, count(taggings.tag_id) as count')
       .joins(:taggings).group('taggings.tag_id')
  end

  def tag_list
    tags.map(&:name)
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
