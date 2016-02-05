require 'sinatra/base'
require './lib/player'
require './lib/game'

class MyApp < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    @player_1 = Player.new(params[:player_1_name])
    @player_2 = Player.new(params[:player_2_name])
    $game = Game.new(@player_1, @player_2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    @player_1 =@game.player_1
    @player_2 = @game.player_2
    @player_1_name = @game.player_1.name
    @player_2_name = @game.player_2.name
    @player_1_hp = @game.player_1.hp
    @player_2_hp = @game.player_2.hp
    erb :play
  end

  get '/attack' do
    @game = $game
    @p1_att_p2 =  @game.attack(@game.player_2)
    @player_1_name = @game.player_1.name
    @player_2_name = @game.player_2.name
    # @player_2_hp = $game.attack($player_2)
    # @player_1.attack(@player_2)
    erb :attack
  end


  run! if app_file == $0
end
