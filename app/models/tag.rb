class Tag < ApplicationRecord
  has_many :taggings, dependent: :delete_all
  has_many :articles, through: :taggings

  validates :name, uniqueness: true
end
