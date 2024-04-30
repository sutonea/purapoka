class RoomsController < ApplicationController

  before_action :set_room, only: [:show, :choice]
  before_action :set_player, only: [:show, :choice]

  def create
    room = Room.new
    room.save!
    redirect_to room
  end

  def show
    @room = Room.find(params[:id])
    @choice = Choice.new
    @last_choice = @player.choices.last&.value
  end

  def choice
    @choice = Choice.new
    @choice.value = params.require(:choice).permit(:choice)[:choice]
    @choice.player = @player
    @choice.save!
    redirect_to @room
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def set_player
    if cookies[:player_id].nil?
      @player = Player.new
      @player.room = @room
      @player.save!
      cookies[:player_id] = @player.id
    else
      @player = Player.find_or_create_by!(id: cookies[:player_id], room: @room)
      cookies[:player_id] = @player.id
    end
  end
end
