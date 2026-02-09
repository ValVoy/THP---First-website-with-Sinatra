require 'sinatra'
require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
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

  get '/gossips/:id/' do
    erb :show, locals: {gossip: Gossip.find(params['id'].to_i), id: params['id'].to_i}
  end

  get '/gossips/:id/edit/' do
    id = params['id'].to_i
    erb :edit, locals: {id: id, gossip: Gossip.find(id)}
  end


end