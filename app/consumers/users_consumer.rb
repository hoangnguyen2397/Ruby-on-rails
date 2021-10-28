class UsersConsumer < ApplicationConsumer
    def consume
        params_batch.each do |params|

            params_json = params.to_json

            Karafka.logger.info "New [User] event: #{params_json}"

            user = JSON.parse(params_json)

            Karafka.logger.info "New [User] value: #{user}"

            user_id = user['raw_payload']

            Karafka.logger.info "New [User_id] value: #{user_id}"

        end
    end
end