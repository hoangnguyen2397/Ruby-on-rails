module Api
    module V2
        module Defaults
            # using ActiveSupport::Concern to add some behavior to whichever of our Grape::API classes mix this in.
            extend ActiveSupport::Concern

            included do
                prefix 'api'
                version 'v2', using: :path
                format :json
            end
        end
    end
end