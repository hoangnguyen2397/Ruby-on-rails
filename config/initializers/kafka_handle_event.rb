KafkaHandleEvent.configure do |config|
    # default adatper is :active_record
    config.adapter = :sequel # in case you use sequel instead of active record
end