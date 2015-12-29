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

desc 'refresh auth'
task :twitter_auth do
  require 'oauth'

  request_token = get_request_token
  puts "Please visit #{request_token.authorize_url}. Then paste your PIN here:"
  pin = gets.chomp
  access_token = authorize_with_pin(request_token, pin)
  puts "Use the following to authenticate to Twitter:"
  puts "OAuth token: #{access_token.token}"
  puts "OAuth secret: #{access_token.secret}"
end
