require 'spec_helper'
require 'rack/test'

feature 'attack other player' do
  include Rack::Test::Methods

  def app
  Battle.new
  end

#Test is written so that they can be run by Capybara.
  scenario 'Player 1 attacks Player 2' do
    sign_in_and_play
    click_button('Attack Mittens')
    expect(page).to have_content('Rufus has attacked Mittens')
  end

  scenario 'Player 1 reduces Player 2 hit points by 10' do
    sign_in_and_play
    click_button('Attack Mittens')
    click_link('PLAY')
    expect(page).to have_content 'Mittens hit points = 50'
  end
end
