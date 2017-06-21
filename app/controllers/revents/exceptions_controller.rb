class Revents::ExceptionsController < ApplicationController
  before_action :set_event

  def create
    if @exception = @revent.revent_exceptions.create(exception_params)
      flash.notice = "Exception added!"
      redirect_to revents_path
    else
      flash.alert = "Unable to add exception"
      redirect_to @revent
    end
  end

  private

    def set_event
      @revent = Revent.find(params[:revent_id])
    end

    def exception_params
      params.require(:event_exception).permit(:time)
    end
end
