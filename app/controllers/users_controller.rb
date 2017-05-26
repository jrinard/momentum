class UsersController < ApplicationController
  def show
    @user = current_user
  end


  def destroy
    @user = User.find(params[:id])
    # @user.people.destroy_all
    if @user.destroy_all
       @user.destroy
       flash[:notice] = "User deleted!"
    redirect_to root_path
    else
      render :edit
      flash[:notice] = "Error User not Deleted"
    end
  end


end
