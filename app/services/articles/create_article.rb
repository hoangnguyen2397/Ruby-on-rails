module Articles
    class CreateArticle < ApplicationService
        def initialize(title:, body:, status:, user_id:)
            @title = title
            @body = body
            @status = status
            @user_id = user_id
        end
    
        def call
            create_article
        end
    
        private
        def create_article
            Article.new(title: @title,
                body: @body,
                status: @status,
                user_id: @user_id)
        end
    end
end