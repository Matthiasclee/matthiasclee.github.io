class TalksController < ApplicationController
  before_action :set_talk, only: %i[ show edit update destroy ]

  # GET /talks or /talks.json
  def index
    @talks = Talk.all.sort_by(&:date).reverse
  end

  # GET /talks/1 or /talks/1.json
  def show
  end

  # GET /talks/new
  def new
    head 401 if !(current_user && current_user.email == 'matthias@matthiasclee.com')
    @talk = Talk.new
  end

  # POST /talks or /talks.json
  def create
    head 401 if !(current_user && current_user.email == 'matthias@matthiasclee.com')
    @talk = Talk.new(talk_params)

    respond_to do |format|
      if @talk.save
        format.html { redirect_to talk_url(@talk), notice: "Talk was successfully created." }
        format.json { render :show, status: :created, location: @talk }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @talk.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_talk
      @talk = Talk.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def talk_params
      params.require(:talk).permit(:name, :location, :website, :download, :date, :conference)
    end
end
