class ArticleWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(article_id)
    article = Article.find(article_id)
    return if article.public?
    article.publish!
  end
end
