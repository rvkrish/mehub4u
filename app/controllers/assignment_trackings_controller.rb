class AssignmentTrackingsController < ApplicationController
  before_action :set_assignment_tracking, only: [:show, :edit, :update, :destroy]

  # GET /assignment_trackings
  # GET /assignment_trackings.json
  def index
    @assignment_trackings = AssignmentTracking.all
  end

  # GET /assignment_trackings/1
  # GET /assignment_trackings/1.json
  def show
  end

  # GET /assignment_trackings/new
  def new
    @assignment_tracking = AssignmentTracking.new
  end

  # GET /assignment_trackings/1/edit
  def edit
  end

  # POST /assignment_trackings
  # POST /assignment_trackings.json
  def create
    @assignment_tracking = AssignmentTracking.new(assignment_tracking_params)

    respond_to do |format|
      if @assignment_tracking.save
        format.html { redirect_to @assignment_tracking, notice: 'Assignment tracking was successfully created.' }
        format.json { render :show, status: :created, location: @assignment_tracking }
      else
        format.html { render :new }
        format.json { render json: @assignment_tracking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignment_trackings/1
  # PATCH/PUT /assignment_trackings/1.json
  def update
    respond_to do |format|
      if @assignment_tracking.update(assignment_tracking_params)
        format.html { redirect_to @assignment_tracking, notice: 'Assignment tracking was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment_tracking }
      else
        format.html { render :edit }
        format.json { render json: @assignment_tracking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignment_trackings/1
  # DELETE /assignment_trackings/1.json
  def destroy
    @assignment_tracking.destroy
    respond_to do |format|
      format.html { redirect_to assignment_trackings_url, notice: 'Assignment tracking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment_tracking
      @assignment_tracking = AssignmentTracking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_tracking_params
      params.require(:assignment_tracking).permit(:assignment_id, :user_id, :topic, :solution, :git_url)
    end
end
