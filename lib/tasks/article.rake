namespace :article do
  desc "TODO"
  task check_expire: :environment do
    ArticleExpireWorker.perform
  end

end
