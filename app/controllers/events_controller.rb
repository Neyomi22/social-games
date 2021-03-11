class EventsController < ApplicationController

  def index
    if params[:type] == "address"
      @events = location_filter
    elsif params[:type] == "sport"
      @events = sport_filter
    elsif params[:type] == "date" && !params[:date].empty?
      @events = date_filter
    else
      @events = Event.where.not(user: current_user)
      @users = User.all
    end
    # the `geocoded` scope filters only events with coordinates (latitude & longitude)
    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { event: event })
      }
    end
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      # Chatroom.create
      redirect_to event_path(@event)
    else
      render :new   
    end
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @events = Event.find(params[:id])
    @events.update(event_params)
    redirect_to event_path(@events)
  end
  
  def show
    @event = Event.find(params[:id])
    @bookings = Booking.where(event: @event)
    @fully_booked = Booking.where(event: @event).count - @event.number_of_participants == 0
    # initialize chatroom
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @chatrooms = Chatroom.all
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.user == current_user && @event.destroy
      redirect_to events_path, :notice => "Your event has been deleted!"
    else
      render "events/show" 
    end
  end

  private

  def location_filter
    # Event.near(params[:location], params[:distance].to_i, order: :distance).each do |user|
    Event.near(params[:location], params[:distance].to_i, order: :distance)
  end

  def date_filter
    param_time = params[:date].empty? ? Time.now.in_time_zone('UTC') : param_time = params[:date].to_datetime.in_time_zone('UTC')
    end_time = param_time + 10.year
    Event.where(starts_at: param_time..end_time).order(:starts_at)
  end

  def sport_filter
    Event.where(sport: params[:sport].capitalize).order(:starts_at)
  end

  def event_params
    params.require(:event).permit(:title, :location, :starts_at, :sport, :number_of_participants, :description, :skill_level, :private, :duration, :photo )
  end

end
