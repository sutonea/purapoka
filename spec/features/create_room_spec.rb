require 'rails_helper'

RSpec.describe 'room', type: :feature do
  scenario 'create a room' do
    visit root_path
    expect { click_on 'Create Room' }.to change { Room.count }.by(1)
    expect(Room.last.id.to_s.length).to be == 36
    expect(page).to have_current_path("/rooms/#{Room.last.id}")
    expect(page).to have_content(room_url(Room.last.id))
  end
end
