# frozen_string_literal: true

module Types
  class ArticleType < Types::BaseObject
    field :id, ID, null: false
    field :title, String
    field :reading_time, Integer
    field :body, String
    # field :cover_url, String
    field :tag_list, [String]
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def body
      object.body.to_plain_text
    end

    def cover_url
      object.cover_url
    end

    def tag_list
      object.tag_list
    end
  end
end
