class StudentFrontPageController < ApplicationController
  before_filter :get_courses
  
  def pdf
  end

  def video
  end

  def certification
  end

  def write_exam
  end

  def schedule_exam
  end

  def view_report
  end

  def share_thoughts
  end

  def chat_rooms
  end

  def groups
  end

  def make_a_note
  end

  def upcomming_events
  end

  def university_syllabus
  end

  def help_desk
  end

  def settings
  end
  
  private
  def get_courses
  @courses = current_user.student.courses
  @free_courses = Course.where(:course_cost => 0)
  end
end
