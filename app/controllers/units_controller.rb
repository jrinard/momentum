class UnitsController < ApplicationController

  def index
    @user = current_user

    @units = Unit.paginate(:page => params[:page]).order(updated_at: :desc)

    if (params[:sort_by])
      @units = Unit.order(params[:sort_by]).paginate(:page => params[:page])
    end

    if params[:search]
      @searchResults = Unit.search(params[:search])
    else
    end

    if params[:search_people]
      @searchResultsPeople = Part.search(params[:search_people])
    else
    end

  end

  def show
    if params[:id]
    @unit = Unit.find(params[:id])
    end
    @showdetail = false
    if params[:showdetail]
      @showdetail = true
    end
  end

  def new
    # @user = User.find(params[:user_id])
    @unit = Unit.new
  end

  def create
   @user = current_user
    @unit = Unit.new(unit_params)
    if @unit.save
      flash[:notice] = "Family Saved!"
      redirect_to units_path
    else
      flash[:notice] = "Family Name is required and it can only contain letters."
      render :new
    end
  end

  def edit
     @user = current_user
     @unit = Unit.new
     @unit = Unit.find(params[:id])
  end

  def update
    @unit = Unit.find(params[:id])
    if @unit.update(unit_params)
      flash[:notice] = "Family updated!"
      redirect_to unit_path(@unit)
    else
      flash[:notice] = "There was an error. Updating the family."
      render :edit
    end
  end

  def destroy
    @unit = Unit.find(params[:id])
    if @unit.destroy
      flash[:notice] = "Family has been deleted!"
      redirect_to units_path
    else
      redirect_to units_path
  end
end

  def unit_params
     params.require(:unit).permit(:familyname, :street, :city, :state, :zip, :country, :phonePrimary, :phoneSecondary, :emailPrimary, :emailSecondary, :notes, :accountowner, :familysearch, :peoplesearch)
  end


end
