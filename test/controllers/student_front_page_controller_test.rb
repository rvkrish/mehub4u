require 'test_helper'

class StudentFrontPageControllerTest < ActionController::TestCase
  test "should get pdf" do
    get :pdf
    assert_response :success
  end

  test "should get video" do
    get :video
    assert_response :success
  end

  test "should get certification" do
    get :certification
    assert_response :success
  end

  test "should get write_exam" do
    get :write_exam
    assert_response :success
  end

  test "should get schedule_exam" do
    get :schedule_exam
    assert_response :success
  end

  test "should get view_report" do
    get :view_report
    assert_response :success
  end

  test "should get share_thoughts" do
    get :share_thoughts
    assert_response :success
  end

  test "should get chat_rooms" do
    get :chat_rooms
    assert_response :success
  end

  test "should get groups" do
    get :groups
    assert_response :success
  end

  test "should get make_a_note" do
    get :make_a_note
    assert_response :success
  end

  test "should get upcomming_events" do
    get :upcomming_events
    assert_response :success
  end

  test "should get university_syllabus" do
    get :university_syllabus
    assert_response :success
  end

  test "should get help_desk" do
    get :help_desk
    assert_response :success
  end

  test "should get settings" do
    get :settings
    assert_response :success
  end

end
