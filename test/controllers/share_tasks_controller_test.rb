require 'test_helper'

class ShareTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @share_task = share_tasks(:one)
  end

  test "should get index" do
    get share_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_share_task_url
    assert_response :success
  end

  test "should create share_task" do
    assert_difference('ShareTask.count') do
      post share_tasks_url, params: { share_task: { is_write: @share_task.is_write, task_list_id: @share_task.task_list_id, user_id: @share_task.user_id } }
    end

    assert_redirected_to share_task_url(ShareTask.last)
  end

  test "should show share_task" do
    get share_task_url(@share_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_share_task_url(@share_task)
    assert_response :success
  end

  test "should update share_task" do
    patch share_task_url(@share_task), params: { share_task: { is_write: @share_task.is_write, task_list_id: @share_task.task_list_id, user_id: @share_task.user_id } }
    assert_redirected_to share_task_url(@share_task)
  end

  test "should destroy share_task" do
    assert_difference('ShareTask.count', -1) do
      delete share_task_url(@share_task)
    end

    assert_redirected_to share_tasks_url
  end
end
