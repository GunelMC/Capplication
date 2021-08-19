require 'sinatra/base'
require 'sinatra/reloader'
require 'http'

class CatManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    json_response = HTTP.headers(:accept => 'application/json').get("https://api.thecatapi.com/v1/images/search?limit=3").to_s
    parsed_json = JSON.parse(json_response)
    @image_urls = parsed_json.map { |image| image['url'] }
    erb :index
  end

  run! if app_file == $0
end