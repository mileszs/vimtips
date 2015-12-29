require 'twitter'

desc "tweet a tip"
task :tweet => :environment do
  if (1..5).include?(Date.today.wday)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = 'WnR849wHagRyXXWWEVZsOzAPn'
      config.consumer_secret = 'YVzj9cliOeGRjW2u6DqCar6jvMU6eOYieJWELA8inGhTmpRupG'
      config.access_token = '15983724-VRueSjMB9Q2P8whWMHHasktamTehQgX44D7EXaMm5'
      config.access_token_secret = '1ZJzJjjlOnmGqcpbgtDVVXSPRtAYiqn1OPUQqeBN5zr10'
    end
    tip = Tip.random
    puts tip.inspect
    client.update(tip.body)
    tip.tweeted_at = Time.now
    tip.save
  end
end
