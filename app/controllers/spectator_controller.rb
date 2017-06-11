class SpectatorsController < ApplicationController

  def index
    @spectators = Spectator.all
  end

  def show
     @spectator = Events.spectator.find(params[:id])
    # @event = Event.find(params[:test])
    # @event = Event.find(params[:id])
  end

  def new
    @spectator = Spectator.new
    if params[:search_people]
      @searchResultsPeople = Part.search(params[:search_people])
    end

  end

  def create
    @spectator = Spectator.new(spectator_params)
    if @spectator.save
      flash[:notice] = "Spectator Saved !!!!!"
         redirect_to events_path
       else
         render :new, notice: 'There was an error saving the person. Please try again.'
       end
  end

  def edit
    @spectator = Spectator.find(params[:id])
  end

  def update
    @spectator = Spectator.find(params[:id])
    if @spectator.update(spectator_params)
      flash[:notice] = "Person updated!"
      redirect_to events_path
    else
      flash[:notice] = "Spectator is required."
      render :edit
    end
  end

  def destroy
    # @event = Event.find(params[:test])
    @spectator = Spectator.find(params[:id])
    if @spectator.destroy
      flash[:notice] = "Spectator has been deleted!"
      # redirect_to events_path
      redirect_to event_path(@spectator.event) #allows routing to same page
    else
  end
end


  def spectator_params
     params.require(:spectator).permit(:event_id, :part_id, :created_at, :updated_at)
  end

end
