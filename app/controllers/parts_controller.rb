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
    @part = Part.new
  end

  def create
   @user = current_user
    @part = Part.new(part_params)
    if @part.save
      flash[:notice] = "Person Saved!"
      redirect_to parts_path
    else
    render :new, notice: 'There was an error saving the person. Please try again.'
    end
  end

  def edit
     @user = current_user
     @part = Part.new
     @part = Part.find(params[:id])
  end

  def update
    @part = Part.find(params[:id])
    if @part.update(part_params)
      flash[:notice] = "Person updated!"
      redirect_to parts_path
    else
      render :edit, notice: 'There was an error updating the person. Please try again.'
    end
  end

  def destroy
    @part = Part.find(params[:id])
    @part.destroy
    flash[:notice] = "Outfit has been deleted!"
    redirect_to root_path
    else
      render :edit
end


  def part_params
     params.require(:part).permit(:title, :firstName, :lastName, :allergies, :parent, :birthdate, :backCheck, :notes, :member, :leader, :user_id)
  end

end
