require 'sinatra'
require 'redis'

get '/pixel.png' do
  redis = Redis.new
  redis.incr('count')
  send_file 'pixel.png', :type => :png
end

get '/count' do
  redis.get('count')
end
