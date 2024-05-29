class  BookingsController < ApplicationController
  def new
    @inn = Inn.find(params[:inn_id])
    @booking = Booking.new()
  end

  def create

  end

  private

  def booking_params
    params.require(:booking).permit(:name, :start_date, :end_date)
  end
end