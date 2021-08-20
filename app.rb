# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'http'
require 'dotenv/load'

class CatManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :method_override

  get '/' do
    json_response = HTTP.headers(accept: 'application/json').get('https://api.thecatapi.com/v1/images/search?limit=3').to_s
    @images = JSON.parse(json_response)
    erb :index
  end

  post '/favourites' do
    HTTP.headers("content-type": 'application/json', "x-api-key": 'e6d7027d-a3a6-48a7-b14a-84b646116158').post(
      'https://api.thecatapi.com/v1/favourites', body: { image_id: params['image_id'] }.to_json
    ).to_s
    redirect '/'
  end

  get '/favourites' do
    json_response = HTTP.headers(accept: 'application/json', "x-api-key": ENV['API_KEY']).get('https://api.thecatapi.com/v1/favourites').to_s
    @favourite_images = JSON.parse(json_response)
    erb :favourites
  end

  delete '/favourites/:id' do
    HTTP.headers("content-type": 'application/json',
                 "x-api-key": 'e6d7027d-a3a6-48a7-b14a-84b646116158').delete("https://api.thecatapi.com/v1/favourites/#{params[:id]}").to_s
    redirect '/favourites'
  end

  get '/breeds' do
    breeds_response = HTTP.headers(accept: 'application/json').get("https://api.thecatapi.com/v1/breeds/#{params['breed_id']}").to_s
    @breeds = JSON.parse(breeds_response)
    erb :'breeds/index'
  end

  run! if app_file == $PROGRAM_NAME
end
