KafkaHandleEvent.register :user do
    topic 'users'

    primary_column :id, :user_id
    map_column :email, :email
    map_column :password, :password

    on_create do | record, raw_message |
        # debugger
        puts record
        puts raw_message
    end

end