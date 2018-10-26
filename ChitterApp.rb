require 'sinatra/base'
# require './lib/ChitterApp'

class ChitterApp < Sinatra::Base

  get '/' do
    @chitter = Chitter.all
    erb :index
  end
  get '/peeps' do
    @chitters = Chitter.all
    erb :peeps
  end

  run! if app_file == $0

end
