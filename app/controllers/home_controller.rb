class HomeController < ApplicationController

  def index
    @user = current_user
    @showlogin = false
    if params[:logout]
      @showlogin = true
    end
    @unit = Unit.order(updated_at: :desc)
  end

  def show
      @unit = Unit.all
      @photoSearchResults = Unit.fuzzy_search(params[:familyName])


  end

  def new

  end


  def create

  end

  def show

  end

end
