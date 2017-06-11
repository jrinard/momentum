class EventsController < ApplicationController

  def index
    @user = current_user
    @parts = Part.all
    @events = Event.all
    @spectators = Spectator.all
  end

  def show
    @events = Event.all
    @spectators = Spectator.all
    @count = Event.all.count

    if params[:id]
    @event = Event.find(params[:id])
    end
    if params[:search_people]
      @searchResultsPeople = Part.search(params[:search_people])
    else
    end
  end

  def new
    @event = Event.new
  end

  def create
   @user = current_user
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Event Saved!"
      redirect_to events_path
    else
      flash[:notice] = "Event Name is required and it can only contain letters."
      render :new
    end
  end

  def edit
    @user = current_user
    @event = Event.new
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = "Event Updated!"
      redirect_to events_path
    else
      flash[:notice] = "There was an error. Updating the event"
      render :edit
  end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      flash[:notice] = "Event has been deleted!"
      redirect_to events_path
    else
      flash[:notice] = "Event can not be deleted if there are people in it."
      redirect_to events_path
    end
  end

  def checkins
    @events = Event.where("DATE(date) = ?", Date.today) #works
  end

  def checkin
    @events = Event.all
    @spectators = Spectator.order(id: :desc)
    @count = Event.all.count
    if params[:id]
    @event = Event.find(params[:id])
    end
  end

  def event_params
    params.require(:event).permit(:name, :description, :date, :starttime, :endtime, :locationname, :street, :state, :city, :zip, :country, :recurring, :attendance, :volunteers, :created_at, :updated_at)
  end

end
