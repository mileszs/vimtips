require 'twitter'

desc "tweet a tip"
task :tweet => :environment do
  (1..5).include?(Date.today.wday)
    Twitter.configure do |config|
      config.consumer_key = 'qQMJvrcMLYKfnqKpMZ0g'
      config.consumer_secret = 'GugrncrHGsYcfLADLoBjypNUfKQrd9LRan6p2zt0'
      config.oauth_token = '15983724-H6IGQpfnR5F2ApSjNKa4ZOZ9bpZN5TciChS2XEG7V'
      config.oauth_token_secret = '4SEcu185msLnABD1caA3GZ1wOil9awdpHZFAG00B50'
    end
    tip = Tip.random
    Twitter.update(tip.body)
    tip.tweeted_at = Time.now
    tip.save
  end
end
