module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # get all articles
    field :articles, [Types::ArticleType], null: false
    def articles
      Article.all
    end

    # get a specific article
    field :article, Types::ArticleType, null: false do
      argument :id, ID, required: true
    end
    def article(id:)
      Article.find(id)
    end
  end
end
