class ReventsController < ApplicationController
  before_action :set_revent, only: [:show, :edit, :update, :destroy]

  # GET /revents
  # GET /revents.json
  def index
    @revents = Revent.all
  end

  # GET /revents/1
  # GET /revents/1.json
  def show
  end

  # GET /revents/new
  def new
    @revent = Revent.new
  end

  # GET /revents/1/edit
  def edit
  end

  # POST /revents
  # POST /revents.json
  def create
    @revent = Revent.new(revent_params)

    respond_to do |format|
      if @revent.save
        format.html { redirect_to @revent, notice: 'Revent was successfully created.' }
        format.json { render :show, status: :created, location: @revent }
      else
        format.html { render :new }
        format.json { render json: @revent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /revents/1
  # PATCH/PUT /revents/1.json
  def update
    respond_to do |format|
      if @revent.update(revent_params)
        format.html { redirect_to @revent, notice: 'Revent was successfully updated.' }
        format.json { render :show, status: :ok, location: @revent }
      else
        format.html { render :edit }
        format.json { render json: @revent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /revents/1
  # DELETE /revents/1.json
  def destroy
    @revent.destroy
    respond_to do |format|
      format.html { redirect_to revents_url, notice: 'Revent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_revent
      @revent = Revent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def revent_params
      params.require(:revent).permit(:name, :start_time, :recurring)
    end
end
