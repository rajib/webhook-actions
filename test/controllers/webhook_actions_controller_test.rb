require 'test_helper'

class WebhookActionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @webhook_action = webhook_actions(:one)
  end

  test "should get index" do
    get webhook_actions_url
    assert_response :success
  end

  test "should get new" do
    get new_webhook_action_url
    assert_response :success
  end

  test "should create webhook_action" do
    assert_difference('WebhookAction.count') do
      post webhook_actions_url, params: { webhook_action: { script: @webhook_action.script, script_type: @webhook_action.script_type, title: @webhook_action.title } }
    end

    assert_redirected_to webhook_action_url(WebhookAction.last)
  end

  test "should show webhook_action" do
    get webhook_action_url(@webhook_action)
    assert_response :success
  end

  test "should get edit" do
    get edit_webhook_action_url(@webhook_action)
    assert_response :success
  end

  test "should update webhook_action" do
    patch webhook_action_url(@webhook_action), params: { webhook_action: { script: @webhook_action.script, script_type: @webhook_action.script_type, title: @webhook_action.title } }
    assert_redirected_to webhook_action_url(@webhook_action)
  end

  test "should destroy webhook_action" do
    assert_difference('WebhookAction.count', -1) do
      delete webhook_action_url(@webhook_action)
    end

    assert_redirected_to webhook_actions_url
  end
end
