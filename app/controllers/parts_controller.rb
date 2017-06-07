class PartsController < ApplicationController

  def index
    @user = current_user
    # @users = User.all
    @part = Part.all
    # @part = @user.part.order(id: :desc)
  end

  def show
     @part = Part.find(params[:id])
  end

  def new
    # @user = User.find(params[:user_id])
    # @part = Part.new(:birthdate => "2000-01-01".to_date)
    @unit = Unit.find(params[:unit_id])
    @part = @unit.parts.new(:birthdate => "2000-01-01".to_date)
  end

  def create
    @unit = Unit.find(params[:unit_id])
    @part = @unit.parts.new(part_params)
    if @part.save
      flash[:notice] = "Person Saved!"
      redirect_to unit_path(@unit)
    else
    render :new, notice: 'There was an error saving the person. Please try again.'
    end
  end

  def edit
     @unit = Unit.find(params[:unit_id])
     @part = Part.find(params[:id])
  end

  def update
    @unit = Unit.find(params[:unit_id])
    @part = Part.find(params[:id])
    if @part.update(part_params)
      flash[:notice] = "Person updated!"
      redirect_to unit_path(@unit)
    else
      flash[:notice] = "First Name is required."
      render :edit
    end
  end

  def destroy
    @unit = Unit.find(params[:unit_id])
    @part = Part.find(params[:id])
    if @part.destroy
      flash[:notice] = "Person has been deleted!"
      redirect_to unit_path(@unit)
    else
      redirect_to unit_path(@unit)
  end
end


  def part_params
     params.require(:part).permit(:title, :firstname, :lastname, :allergies, :parent, :birthdate, :backCheck, :notes, :member, :leader, :user_id)
  end

end
