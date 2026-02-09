require 'sinatra'
require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  # On peut aussi écrire : 
  # post '/gossips/new/' do
  #   author = params["gossip_author"]
  #   content = params["gossip_content"]
  #   Gossip.new(author, content).save
  #   redirect '/'

end