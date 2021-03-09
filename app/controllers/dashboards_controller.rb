class DashboardsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
    @bookings = @bookings.sort_by{|b| b.created_at }.reverse
    @events = Event.where(user: current_user)
    @events = @events.sort_by{|e| e.starts_at }
  end

  def show
    
  end

end
