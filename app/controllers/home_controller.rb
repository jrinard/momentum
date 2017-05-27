class HomeController < ApplicationController

  def index
    @user = current_user
    @unit = Unit.order(updated_at: :desc)
  end

  def show
      # Not Currently Working
      @results = Unit.fuzzy_search(params[:familyName])
  end

  def new

  end


  def create

  end

  def show

  end

end
