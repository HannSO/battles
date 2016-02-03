
require 'sinatra/base'

class Battle < Sinatra::Base
  get '/' do
    # @player_1_name = params[:player_1_name]
    # @player_2_name = params[:player_2_name]
    erb :index
  end

  enable :sessions
  post '/names' do

    session['player_1_name']= params[:player_1_name]
    session['player_2_name']= params[:player_2_name]
    redirect '/play'
  end

  get '/play' do
    @player_1_name = session['player_1_name']
    @player_2_name = session['player_2_name']

    erb:play
  end

  get '/confirmation' do
    @player_1_name = session['player_1_name']
    @player_2_name = session['player_2_name']
    erb:confirmation
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
