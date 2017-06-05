class DepartmentsController < ApplicationController

  def index
    @user = current_user
    @parts = Part.all
    @departments = Department.all
    @positions = Position.all
  end

  def show
    @departments = Department.all
    @positions = Position.all

    if params[:id]
    @department = Department.find(params[:id])
    end
    if params[:search_people]
      @searchResultsPeople = Part.search(params[:search_people])
    else
    end
  end

  def new
    @department = Department.new
  end

  def create
   @user = current_user
    @depart = Department.new(depart_params)
    if @depart.save
      flash[:notice] = "Department Saved!"
      redirect_to departments_path
    else
      flash[:notice] = "Department Name is required and it can only contain letters."
      render :new
    end
  end

  def edit
    @user = current_user
    @department = Department.new
    @department = Department.find(params[:id])
  end

  def update
    @department = Department.find(params[:id])
    if @department.update(depart_params)
      flash[:notice] = "Deparment Updated!"
      redirect_to department_path(@department)
    else
      flash[:notice] = "There was an error. Updating the department"
      render :edit
  end
  end

  def destroy
    @department = Department.find(params[:id])
    if @department.destroy
      flash[:notice] = "Department has been deleted!"
      redirect_to departments_path
    else
      redirect_to departments_path
    end
  end

  def depart_params
    params.require(:department).permit(:name, :description, :leaderName, :p_id)
  end


end
