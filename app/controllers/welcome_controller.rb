class WelcomeController < ApplicationController
  def index
    @student = Student.new
    @teacher = Teacher.new
  end
  def welcome_student
    
  end
  def welcome_teacher
    
  end
end
