EhProtobuf.config_client(
    EhProtobuf::EmploymentHero,
    host: ENV['EH_RPC_HOST'] || 'localhost',
    port: ENV['EH_RPC_PORT'] || 50_053
  )