class EventsController < ApplicationController

  def index
    # if params[:type] == "address"
    #   location_filter
    # end
    if params.keys.count <= 2
      @events = Event.where.not(user: current_user)
      @users = User.all
    elsif params[:type] == "address"
      @events = location_filter
    elsif params[:type] == "sport"
      @events = sport_filter
    # elsif params[:type] == "date"
      # @events = date_filter
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
    # initialize chatroom
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @chatrooms = Chatroom.all
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy && @event.user == @current_user 
      redirect_to events_path, :notice => "Your event has been deleted!"
    else
      render event_path
    end
  end

  private

  def location_filter
    events = []
    @user.near(params[:location], params[:distance].to_i, order: :distance)
      @users.each do |user|
        events << Event.where(user_id: user.id)
      end
      events.flatten!
  end

  def date_filter
    # events = Event.where
  end

  def sport_filter
    Event.where(sport: params[:sport].capitalize).order(:starts_at)
  end


  def event_params
    params.require(:event).permit(:title, :location, :starts_at, :sport, :number_of_participants, :description, :skill_level, :private, :duration)
  end

end
