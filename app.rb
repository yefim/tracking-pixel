require 'sinatra'
require 'redis'

get '/pixel.png' do
  redis.incr('count')
  redis.close
  send_file 'pixel.png', type: :png
end

get '/count' do
  count = redis.get('count')
  redis.close
  count
end

def redis
  @redis ||= Redis.new(url: ENV["REDIS_URL"])
end
