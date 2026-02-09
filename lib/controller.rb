require 'sinatra'
require 'gossip'
require 'comment'

class ApplicationController < Sinatra::Base
  set :views, File.expand_path('views', __dir__)
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
    id = params['id'].to_i
    erb :show, locals: {
      gossip: Gossip.find(id), 
      id: id, 
      comments: Comment.all_with_id(id) 
    }
  end

  get '/gossips/:id/edit/' do
    id = params['id'].to_i
    erb :edit, locals: {id: id, gossip: Gossip.find(id)}
  end

  post '/gossips/:id/edit/' do
    Gossip.update(params['id'].to_i, params["gossip_author"], params["gossip_content"])
    redirect '/'
  end

  post '/gossips/:id/comments/' do
    Comment.new(params['id'].to_i, params['comment_content']).save
    redirect "/gossips/#{params['id']}/"
  end


end