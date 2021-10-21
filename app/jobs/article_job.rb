class ArticleJob < ApplicationJob
  queue_as :default

  def perform(article)
    return if article.public?
    article.publish!
  end
end
