class UsersController < ApplicationController

  def get_user
    @user = current_user
    @current_user = current_user
  end

  before_filter :get_user
  load_and_authorize_resource :only => [:show,:new,:destroy,:edit,:update]

  def index
    @users = User.accessible_by(current_ability, :index).limit(20)
    respond_to do |format|
      format.json { render :json => @users }
      format.html
    end
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.json { render :json => @user }
      format.html
    end
  rescue ActiveRecord::RecordNotFound
    respond_to_not_found(:json, :xml, :html)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "User deleted!"
      redirect_to users_path
    else
      render :edit
      flash[:notice] = "Error User not Deleted"
    end
  end

  #NOT Currently Using
  # def new
  #   respond_to do |format|
  #     format.json { render :json => @user }
  #     format.html
  #   end
  # end

  # def create
  #   @user = User.new(params[:user])
  #   if @user.save
  #     respond_to do |format|
  #       format.json { render :json => @user.to_json, :status => 200 }
  #       # format.html { redirect_to :action => :index }
  #       flash[:notice] = "User Saved!"
  #       redirect_to units_path
  #     end
  #   else
  #     respond_to do |format|
  #       flash[:notice] = "Could not create user."
  #       format.json { render :text => "Could not create user", :status => :unprocessable_entity } # placeholder
  #       format.html { render :action => :new, :status => :unprocessable_entity }
  #     end
  #   end
  # end

private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end

end
