class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  layout "admin"
  #Add Course to student
  def add_course
    current_user.student.student_courses.create({course_id: params[:course_id],state: "applied"})
    render :text => "Successfully Applied"
  end
  
  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    if current_user.has_role? :admin
      respond_to do |format|
        if @student.save
          #TODO adding role to student
          format.html { redirect_to @student, notice: 'Student was successfully created.' }
          format.json { render :show, status: :created, location: @student }
        else
          format.html { render :new }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
    else
      if @student.save
          @student.user_id = current_user.id
          @student.save
          current_user.add_role :student
          redirect_to "/welcome/welcome_student"
        else
          redirect_to "/welcome/index"
        end
      
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :college, :branch, :year, :address, :user_id)
    end
end
