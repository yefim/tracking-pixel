require 'sinatra'
require 'redis'

get '/pixel.png' do
  redis.incr('count')
  send_file 'pixel.png', :type => :png
end

get '/count' do
  redis.get('count')
end

def redis
  @redis ||= Redis.new(url: ENV["REDIS_URL"])
end
