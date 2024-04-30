require 'rails_helper'

RSpec.describe Room, type: :model do
  it 'generates a password for join' do
    room = Room.new
    room.save
    expect(room.password_for_join).to_not be_nil
  end

  it 'generates a expired_at' do
    room = Room.new
    room.save
    expect(room.expired_at).to_not be_nil
  end

  describe 'join with password' do
    let(:room) { Room.create! }
    let(:correct_password) { room.password_for_join }
    let(:incorrect_password) { 'incorrect' }

    context 'with correct password' do
      subject { room.join(password_for_join: correct_password) }
      it { is_expected.to be_truthy }

      describe 'players' do
        it 'creates a player' do
          expect { subject }.to change { room.players.count }.by(1)
        end
      end
    end

    context 'with incorrect password' do
      subject { room.join(password_for_join: incorrect_password) }
      it { is_expected.to be_falsey }
    end
  end
end
