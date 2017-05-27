class UnitsController < ApplicationController

  def index
    @user = current_user
    @unit = Unit.order(updated_at: :desc)
  if (params[:sort_by])
    @unit = Unit.order(params[:sort_by])
  end


  # familyName: :asc

    # @results = Work.basic_search(params[:search])

    # if (params[:order] == 'rank')
    #   @array.sort_by!(&:asc)
    # end
  end

  def show
    @unit = Unit.find(params[:id])

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
    render :new, notice: 'There was an error saving the family. Please try again.'
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
      render :edit, notice: 'There was an error updating the Family. Please try again.'
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
     params.require(:unit).permit(:familyName, :street, :city, :state, :zip, :country, :phonePrimary, :phoneSecondary, :emailPrimary, :emailSecondary, :notes)
  end

end
