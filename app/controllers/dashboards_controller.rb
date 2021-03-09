class DashboardsController < ApplicationController
  def index
    @bookings = Booking.all
    @events = Event.where(user: current_user)
  end

  def show
    
  end
end
