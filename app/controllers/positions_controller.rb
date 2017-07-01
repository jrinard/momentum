class PositionsController < ApplicationController

  def index
    @positions = Position.all
  end

  def show
     @position = Position.find(params[:id])
  end

  def new
    @department = Department.find(params[:dep_id])
    @position = Position.new
    # @position = Position.new(@dep_id = params[:id])




    if params[:search_people]
      @searchResultsPeople = Part.search(params[:search_people])
    end
  end

  def create
    @position = Position.new(position_params)
    if @position.save
      flash[:notice] = "Position Saved"
      redirect_to departments_path
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
      flash[:notice] = "Person updated"
      redirect_to departments_path
    else
      flash[:notice] = "Position is required"
      render :edit
    end
  end

  def destroy
    @position = Position.find(params[:id])
    @position.destroy
    # flash[:notice] = "Position has been deleted!"
    # redirect_to departments_path
    respond_to do |format|
            format.html { redirect_to departments_path }
            format.js
          end

end


  def position_params
     params.require(:position).permit(:need, :position2, :user_id, :department_id, :part_id)
  end

end
