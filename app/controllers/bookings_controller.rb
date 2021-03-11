class BookingsController < ApplicationController
  before_action :set_booking, only: [:create, :new]

  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    @booking.event = @event
    @booking.user = current_user
    unless @booking.save
      render :new
    end
  end 

  def update
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      redirect_to dashboards_path
    else
      render :new
    end
  end

  private

  def set_booking
    @event = Event.find(params[:event_id])
  end

  # def booking_params
  #   params.require(:booking).permit(:event_id )
  # end
end
