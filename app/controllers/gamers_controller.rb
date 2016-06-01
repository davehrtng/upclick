class GamersController < ApplicationController
  before_action :set_gamer, only: [:show, :edit, :update]
  before_filter -> { check_privs(params[:id]) }, only: [:edit, :update]
  
  def check_privs(gamer_id)
      redirect_to "/", notice: 'Sorry, you do not have permission to do that.' unless (user_signed_in? && current_user.gamer.id.to_s == gamer_id)
  end

  # GET /gamers
  # GET /gamers.json
  def index
    # need to return these in descending order of number of clicks
    @gamers = Gamer.all
  end

  # GET /gamers/1
  # GET /gamers/1.json
  def show
  end

  # GET /gamers/1/edit
  def edit
  end

  # PATCH/PUT /gamers/1
  # PATCH/PUT /gamers/1.json
  def update
    respond_to do |format|
      if @gamer.update(gamer_params)
        format.html { redirect_to @gamer, notice: 'Gamer was successfully updated.' }
        format.json { render :show, status: :ok, location: @gamer }
      else
        format.html { render :edit }
        format.json { render json: @gamer.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gamer
      @gamer = Gamer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gamer_params
      params.require(:gamer).permit(:gamer_tag, :level_id)
    end
end
