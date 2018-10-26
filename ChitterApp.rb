require 'sinatra/base'
# require './lib/ChitterApp'

class ChitterApp < Sinatra::Base

  get '/' do
    "Peep what's happening right now"
  end
  get '/peeps' do
    @chitters = Chitter.all
    erb :
  end

  run! if app_file == $0

end
