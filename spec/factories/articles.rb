FactoryBot.define do
    factory :article do
      title { 'test article' }
      body { "This is test article" }
      status { 'public' }
      user_id {1}
    end
end