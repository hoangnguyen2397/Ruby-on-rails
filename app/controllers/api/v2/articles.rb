module Api
    module V2
        class Articles < Grape::API
            # include Api::V2::Defaults
            prefix 'api'
            version 'v2', using: :path
            format :json

            helpers do
            end

            resource :articles do
                desc "Get all articles"
                get do
                    articles = Article.all
                    # Grape Entity
                    present articles, with: Api::V2::Entities::Article
                end

                desc "Get a article"
                params do
                    requires :id, type: Integer
                end
                route_param :id do
                    get do
                        Article.find(params[:id])
                    end
                end

                desc 'Create a new article'
                params do
                    requires :title, type: String
                    requires :body, type: String
                    requires :status, type: String
                    requires :user_id, type: Integer
                end
                post do
                    Article.create!(title: params[:title], body: params[:body], status: params[:status], user_id: params[:user_id])
                end

                desc 'Update an article'
                params do
                    requires :id, type: Integer
                    optional :title, type: String
                    optional :body, type: String
                    optional :status, type: String
                end
                put ':id' do
                    Article.find(params[:id]).update(title: params[:title], body: params[:body], status: params[:status])
                end

                desc "Delete article"
                params do
                    requires :id, type: Integer
                end
                delete ':id' do
                    Article.find(params[:id]).destroy
                end
            end
        end
    end
end