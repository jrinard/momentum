class PositionsController < ApplicationController

  def index
    @positions = Position.all
  end

  def show
     @position = Position.find(params[:id])
  end

  def new
    @position = Position.new
  end

  def create
    @position = Position.new(position_params)
    if @position.save
      flash[:notice] = "Position Saved !!!!!"
      redirect_to root_path
    else
    render :new, notice: 'There was an error saving the person. Please try again.'
    end
  end

  def edit
    @position = Position.find(params[:id])
  end

  def update
    @position = Position.find(params[:id])
    if @position.update(position_params)
      flash[:notice] = "Person updated!"
      redirect_to root_path
    else
      flash[:notice] = "Position is required."
      render :edit
    end
  end

  def destroy
    @position = Position.find(params[:id])
    if @position.destroy
      flash[:notice] = "Position has been deleted!"
      redirect_to positions_path
    else
  end
end


  def position_params
     params.require(:position).permit(:title, :firstName, :lastName, :allergies, :parent, :birthdate, :backCheck, :notes, :member, :leader, :user_id, :department_id, :part_id)
  end

end
