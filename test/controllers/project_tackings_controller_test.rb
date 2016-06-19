require 'test_helper'

class ProjectTackingsControllerTest < ActionController::TestCase
  setup do
    @project_tacking = project_tackings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_tackings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_tacking" do
    assert_difference('ProjectTacking.count') do
      post :create, project_tacking: { completed: @project_tacking.completed, git_url: @project_tacking.git_url, key: @project_tacking.key, project_id: @project_tacking.project_id, remaining: @project_tacking.remaining, student_id: @project_tacking.student_id, value: @project_tacking.value }
    end

    assert_redirected_to project_tacking_path(assigns(:project_tacking))
  end

  test "should show project_tacking" do
    get :show, id: @project_tacking
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_tacking
    assert_response :success
  end

  test "should update project_tacking" do
    patch :update, id: @project_tacking, project_tacking: { completed: @project_tacking.completed, git_url: @project_tacking.git_url, key: @project_tacking.key, project_id: @project_tacking.project_id, remaining: @project_tacking.remaining, student_id: @project_tacking.student_id, value: @project_tacking.value }
    assert_redirected_to project_tacking_path(assigns(:project_tacking))
  end

  test "should destroy project_tacking" do
    assert_difference('ProjectTacking.count', -1) do
      delete :destroy, id: @project_tacking
    end

    assert_redirected_to project_tackings_path
  end
end
