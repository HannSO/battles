

def sign_in_and_play
  visit('/')
  fill_in :player_1_name, with: 'Rufus'
  fill_in :player_2_name, with: 'Mittens'
  click_button 'Submit'
end

def first_turn
  click_button('Attack Mittens')
  click_link('PLAY')
end
