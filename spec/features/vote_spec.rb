require 'spec_helper'

RSpec.describe 'vote', type: :feature do
  let(:room) { Room.create }

  scenario 'vote 1' do
    room.players.create
    visit room_path(room.id)
    expect(page).not_to have_content('Your choice')
    expect { click_on '1' }.to change { Choice.count }.by(1)
    expect(Choice.last.value).to be == 1
    expect(page).to have_current_path("/rooms/#{room.id}")
    expect(page).to have_content('Your choice: 1')
  end

  scenario 'vote 3' do
    room.players.create
    visit room_path(room.id)
    expect(page).not_to have_content('Your choice')
    expect { click_on '3' }.to change { Choice.count }.by(1)
    expect(Choice.last.value).to be == 3
    expect(page).to have_current_path("/rooms/#{room.id}")
    expect(page).to have_content('Your choice: 3')
  end
end

