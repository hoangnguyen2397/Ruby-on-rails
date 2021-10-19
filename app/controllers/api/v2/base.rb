module Api
    module V2
        class Base < Grape::API
            mount V2::Articles
        end
    end
end