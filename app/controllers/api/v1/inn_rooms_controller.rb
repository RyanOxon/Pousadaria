class Api::V1::InnRoomsController < Api::V1::ApiController

  def show
    @inn_room = InnRoom.find(params[:id])
    render status: 200, json: @inn_room.as_json(:only => [:name, :size, :guest_limit, :daily_rate_cents])
  end

end