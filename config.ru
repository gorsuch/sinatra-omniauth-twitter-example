require 'multi_json'
require 'omniauth'
require 'omniauth-twitter'
require 'sinatra'

class Web < Sinatra::Base
  use Rack::Session::Cookie
  use OmniAuth::Builder do
    provider :twitter, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']
  end
  
  get '/auth/twitter/callback' do
    request.env['omniauth.auth'].inspect
  end
end

run Web.new
