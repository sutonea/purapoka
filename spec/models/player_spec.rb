require 'rails_helper'

RSpec.describe Player, type: :model do
  it 'generates id' do
    player = Player.new
    player.build_room
    player.save
    expect(player.id).to_not be_nil
  end
end
