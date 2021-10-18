class CommentSerializer < ActiveModel::Serializer
  attributes :commenter, :body

  belongs_to :article
end
