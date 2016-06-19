class AdminController < ApplicationController
  layout "admin"
  def index
    @students = Student.all
    @teachers = Teacher.all
    @courses = Course.all
  end
end
