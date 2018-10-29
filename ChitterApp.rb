require 'sinatra/base'
require_relative './lib/chitter'

class ChitterApp < Sinatra::Base

  enable :sessions

  get '/' do
    redirect '/index'
  end

  get '/index' do
    @peep = chitter.all
    @username = session[:username]
    erb :index
  end

  post '/new' do
    chitter.add(params[:peep], session[:username])
    redirect '/index'
  end

  get '/sign_in' do
    erb :sign_in
  end

  post '/sign_in' do
    session[:username] = params[:username]
    session[:password] = params[:password]
    redirect '/index'
  end

  get '/sign_out' do
    erb :sign_out
  end

  post '/sign_out' do
    session[:username] = nil
    redirect '/index'
  end

  run! if app_file == $0
end
