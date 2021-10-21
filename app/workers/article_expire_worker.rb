class ArticleExpireWorker
  include Sidekiq::Worker

  def self.perform
    Article.all.each do |article|
      return if article.archived?
      article.make_expire! if article.created_at < Time.now
    end
  end
end
