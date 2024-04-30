require 'rails_helper'

RSpec.describe "Rooms", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/rooms/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /join" do
    it "returns http success" do
      get "/rooms/join"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    let(:room) { Room.create }
    let(:player) { room.players.create }
    it "returns http success" do
      get "/rooms/show"
      expect(response).to have_http_status(:success)
    end
  end

end
