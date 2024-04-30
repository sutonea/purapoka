class RoomsController < ApplicationController

  before_action :set_room, only: [:show, :choice, :average, :reset]
  before_action :set_player, only: [:show, :choice, :average]

  def create
    room = Room.new
    room.save!
    redirect_to room
  end

  def show
    @room = Room.find(params[:id])
    @choice = Choice.new
    @last_choice = @player.choices.last&.value
    @average = @room.calculation_results.last&.average
  end

  def choice
    @choice = Choice.new
    @choice.value = params.require(:choice).permit(:choice)[:choice]
    @choice.player = @player
    @choice.save!
    redirect_to @room
  end

  def average
    if @room.calculation_results.present?
      render json: { average: @room.calculation_results.last.average }, status: :ok
      return
    end
    num_player = @room.players.count
    num_votes = @room.players.map(&:choices).flatten.count
    render json: { average: nil }, status: :ok and return if num_player > num_votes
    average = @room.players.map(&:choices).flatten.map(&:value).sum.to_f / num_votes
    @room.calculation_results.create!(average: average)
    render json: { average: @room.players.map(&:choices).flatten.map(&:value).sum.to_f / num_votes }, status: :ok
  end

  def reset
    @room.calculation_results&.map(&:destroy)
    @room.players.map(&:choices).flatten.map(&:destroy)
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
