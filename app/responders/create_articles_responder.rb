class CreateArticlesResponder < ApplicationResponder
    topic :create_article

    def respond(article)
      respond_to :create_article, article
    end
end