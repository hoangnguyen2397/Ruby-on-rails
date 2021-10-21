# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

every "* * * * *" do
    runner "ArticleExpireWorker.perform"
end

# every "* * * * *" do
#     rake "article:check_expire"
# end

# every 1.minute do
# end

# Learn more: http://github.com/javan/whenever
