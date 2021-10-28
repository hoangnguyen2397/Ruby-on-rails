class CreateArticlesConsumer < ApplicationConsumer
    def consume
        Karafka.logger.info "New [Article] event: #{params.to_json}"
    end
end