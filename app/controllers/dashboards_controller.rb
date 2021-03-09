class DashboardsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
    @events = Event.where(user: current_user)
  end

  def show
    
  end
end
