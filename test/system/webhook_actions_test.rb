require "application_system_test_case"

class WebhookActionsTest < ApplicationSystemTestCase
  setup do
    @webhook_action = webhook_actions(:one)
  end

  test "visiting the index" do
    visit webhook_actions_url
    assert_selector "h1", text: "Webhook Actions"
  end

  test "creating a Webhook action" do
    visit webhook_actions_url
    click_on "New Webhook Action"

    fill_in "Script", with: @webhook_action.script
    fill_in "Script type", with: @webhook_action.script_type
    fill_in "Title", with: @webhook_action.title
    click_on "Create Webhook action"

    assert_text "Webhook action was successfully created"
    click_on "Back"
  end

  test "updating a Webhook action" do
    visit webhook_actions_url
    click_on "Edit", match: :first

    fill_in "Script", with: @webhook_action.script
    fill_in "Script type", with: @webhook_action.script_type
    fill_in "Title", with: @webhook_action.title
    click_on "Update Webhook action"

    assert_text "Webhook action was successfully updated"
    click_on "Back"
  end

  test "destroying a Webhook action" do
    visit webhook_actions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Webhook action was successfully destroyed"
  end
end
