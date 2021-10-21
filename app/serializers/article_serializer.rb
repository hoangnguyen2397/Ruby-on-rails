class ArticleSerializer < ActiveModel::Serializer
  attributes :title, :body, :status

  has_many :comments
end
