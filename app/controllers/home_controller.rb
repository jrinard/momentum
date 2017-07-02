class HomeController < ApplicationController

  def index
    @user = current_user
    @unit = Unit.order(updated_at: :desc)
    @revents = Revent.all
    @calendar_events = @revents.flat_map{ |e| e.calendar_events(params.fetch(:start_date, Time.zone.now).to_date) }   # running calendar_events method and passing start date tells our recurring events where we want to grab.. thinking about exceptions

  end

  def show
  end

  def new
  end


  def create
  end

end
