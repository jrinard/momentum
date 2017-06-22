class ReventsController < ApplicationController
  before_action :set_revent, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @parts = Part.all
    @revents = Revent.all
    @calendar_events = @revents.flat_map{ |e| e.calendar_events(params.fetch(:start_date, Time.zone.now).to_date) }   # running calendar_events method and passing start date tells our recurring events where we want to grab.. thinking about exceptions

    @spectators = Spectator.all
  end

  def show
    @revents = Revent.all
    @spectators = Spectator.all
    # @count = Revent.all.count

    if params[:id]
    @revent = Revent.find(params[:id])
    end

    begin
      @time = Time.parse(params[:time])
    rescue
      @time = @revent.start_time
    end
  end

  def new
    @revent = Revent.new
  end

  def create
    @revent = Revent.new(revent_params)

    respond_to do |format|
      if @revent.save
        format.html { redirect_to @revent, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @revent }
      else
        format.html { render :new }
        format.json { render json: @revent.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @revent = Revent.new
    @revent = Revent.find(params[:id])
  end

  def update
    respond_to do |format|
      if @revent.update(revent_params)
        format.html { redirect_to @revent, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @revent }
      else
        format.html { render :edit }
        format.json { render json: @revent.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @revent = Revent.find(params[:id])
    @revent.destroy
    respond_to do |format|
      format.html { redirect_to revents_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_revent
      @revent = Revent.find(params[:id])
    end

    def revent_params
      params.require(:revent).permit(:name, :start_time, :recurring, :description, :locationname, :street, :state, :city, :zip, :country, :created_at, :updated_at)
    end
end
