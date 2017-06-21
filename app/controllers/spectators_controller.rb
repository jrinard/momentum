class SpectatorsController < ApplicationController

  def index
    @spectators = Spectator.all
  end

  def show
    @spectator = Spectator.find(params[:id])
    # @spectator = Revents.spectator.find(params[:id])
    # @revent = Revent.find(params[:test])
    # @revent = Revent.find(params[:id])
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
      flash[:notice] = "Spectator Saved"
         redirect_to revents_path
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
      flash[:notice] = "Person updated"
      redirect_to revents_path
    else
      flash[:notice] = "Spectator is required."
      render :edit
    end
  end

  def destroy
    # @revent = Revent.find(params[:test])
    @spectator = Spectator.find(params[:id])
    if @spectator.destroy
      flash[:notice] = "Spectator has been deleted"
      redirect_to revents_path
      # redirect_to revent_path(@spectator.revent) #use to allow routing to same page
    else
  end
end


  def spectator_params
     params.require(:spectator).permit(:revent_id, :part_id, :created_at, :updated_at)
  end

end
