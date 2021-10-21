# class Api::V1::ArticlesController < ApplicationController

# end

# module Api
#     module V1
#         class ArticlesController < ::ApplicationController
#            
#         end
#     end
# end

# Access with ApplicationController in controllers

# ------------------------------------ # ------------------------------------------

# Access with ApplicationController in controllers/api/v1

# class Api::V1::ArticlesController < Api::V1::ApplicationController
#     
# end

module Api
    module V1
        class ArticlesController < ApplicationController
            def index
                @articles = Article.all
                render json: @articles
                # render json: @articles.to_json(include: [comments: {}])
            end

            def show
                @article = Article.find(params[:id])
                render json: @article
            end

            def create
                @article = Article.new(article_params)
                if @article.save
                    # ArticleJob.set(wait: 1.minute).perform_later(@article)
                    ArticleWorker.set(wait: 1.minute).perform_async(@article.id)
                    # ArticleWorker.perform_in(1.minute, @article.id)
                    render json: @article
                else
                    render json: @article.errors
                end
            end

            # def create
            #     @article = Articles::CreateArticle.call(
            #         title: params[:title],
            #         body: params[:body],
            #         status: params[:status],
            #         user_id: params[:user_id]
            #     )
            #     if @article.save
            #         ArticleWorker.set(wait: 1.minute).perform_async(@article.id)
            #         render json: @article
            #     else
            #         render json: @article.errors
            #     end
            # end

            def destroy
                @article = Article.find(params[:id])
                @article.destroy
                render json: @article
            end

            def update
                @article = Article.find(params[:id])
                if @article.update(article_params)
                    render json: @article
                else
                    render json: @article.errors
                end
            end
            
            private
            def article_params
                params.require(:article).permit(:title, :body, :status, :user_id)
            end
        end
    end
end