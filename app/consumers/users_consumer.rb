class UsersConsumer < ApplicationConsumer
    def consume
        # Karafka.logger.info "New [User] event: #{params.topic}"
        # puts "\n"
        # Karafka.logger.info "New [Payload] event: #{params.payload}"

        # payload = params.payload

        # message = {
        #     'topic_type' => params.topic,
        #     'event' => 'create',
        #     'user_id' => payload['user_id'],
        #     'data' => {
        #         'email' => payload['personal_email'],
        #         'password' => 123456,
        #     }
        # }

        message = params.payload
        message['topic_type'] = params.topic

        puts message
        # debugger
        KafkaHandleEvent.handle_event(message)
    rescue ActiveRecord::RecordNotUnique => e
        Rails.logger.error("ERROR in #{self.class.name}#consume: #{e.message}")
    rescue ActiveRecord::ActiveRecordError => e
        Rails.logger.error("ERROR in #{self.class.name}#consume: #{e.message}")

    end
end