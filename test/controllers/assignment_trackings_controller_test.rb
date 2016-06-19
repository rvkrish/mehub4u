require 'test_helper'

class AssignmentTrackingsControllerTest < ActionController::TestCase
  setup do
    @assignment_tracking = assignment_trackings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assignment_trackings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assignment_tracking" do
    assert_difference('AssignmentTracking.count') do
      post :create, assignment_tracking: { assignment_id: @assignment_tracking.assignment_id, git_url: @assignment_tracking.git_url, solution: @assignment_tracking.solution, topic: @assignment_tracking.topic, user_id: @assignment_tracking.user_id }
    end

    assert_redirected_to assignment_tracking_path(assigns(:assignment_tracking))
  end

  test "should show assignment_tracking" do
    get :show, id: @assignment_tracking
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @assignment_tracking
    assert_response :success
  end

  test "should update assignment_tracking" do
    patch :update, id: @assignment_tracking, assignment_tracking: { assignment_id: @assignment_tracking.assignment_id, git_url: @assignment_tracking.git_url, solution: @assignment_tracking.solution, topic: @assignment_tracking.topic, user_id: @assignment_tracking.user_id }
    assert_redirected_to assignment_tracking_path(assigns(:assignment_tracking))
  end

  test "should destroy assignment_tracking" do
    assert_difference('AssignmentTracking.count', -1) do
      delete :destroy, id: @assignment_tracking
    end

    assert_redirected_to assignment_trackings_path
  end
end
