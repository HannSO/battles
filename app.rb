
require 'sinatra/base'
require 'player'

class Battle < Sinatra::Base
  get '/' do
    # @player_1_name = params[:player_1_name]
    # @player_2_name = params[:player_2_name]
    erb :index
  end

  enable :sessions
  post '/names' do
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    redirect '/play'
  end

  get '/play' do
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name

    erb:play
  end

  get '/confirmation' do
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    erb:confirmation
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
