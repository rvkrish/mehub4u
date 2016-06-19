class ProjectTackingsController < ApplicationController
  before_action :set_project_tacking, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /project_tackings
  # GET /project_tackings.json
  def index
    @user = current_user
    @student = current_user.student
    # @project_tackings = ProjectTacking.all
    @tracking = @student.project_tackings
  end

  # GET /project_tackings/1
  # GET /project_tackings/1.json
  def show
  end

  # GET /project_tackings/new
  def new
    @project_tacking = ProjectTacking.new
  end

  # GET /project_tackings/1/edit
  def edit
  end

  # POST /project_tackings
  # POST /project_tackings.json
  def create
    @project_tacking = ProjectTacking.new(project_tacking_params)
    @project_tacking.student_id = current_user.student.id

    respond_to do |format|
      if @project_tacking.save
        format.html { redirect_to @project_tacking, notice: 'Project tacking was successfully created.' }
        format.json { render :show, status: :created, location: @project_tacking }
      else
        format.html { render :new }
        format.json { render json: @project_tacking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_tackings/1
  # PATCH/PUT /project_tackings/1.json
  def update
    respond_to do |format|
      if @project_tacking.update(project_tacking_params)
        format.html { redirect_to @project_tacking, notice: 'Project tacking was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_tacking }
      else
        format.html { render :edit }
        format.json { render json: @project_tacking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_tackings/1
  # DELETE /project_tackings/1.json
  def destroy
    @project_tacking.destroy
    respond_to do |format|
      format.html { redirect_to project_tackings_url, notice: 'Project tacking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_tacking
      @project_tacking = ProjectTacking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_tacking_params
      params.require(:project_tacking).permit(:project_id, :git_url, :key, :value, :completed, :remaining)
    end
end
