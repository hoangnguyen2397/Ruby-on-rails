module Api
    module V2
        module Entities
            class Article < Grape::Entity
                expose :title
                expose :body
                expose :status
            end
        end
    end
end