require 'sinatra'
require 'redis'

get '/:key/pixel.png' do
  redis.incr("count-#{params['key']}")
  redis.close
  send_file 'pixel.png', type: :png
end

get '/:key/count' do
  count = redis.get("count-#{params['key']}")
  redis.close
  count
end

get '/:key/clear' do
  redis.del("count-#{params['key']}")
  redis.close
  return
end

def redis
  @redis ||= Redis.new(url: ENV["REDIS_URL"])
end
