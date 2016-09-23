require 'test_helper'

class TutorialStepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tutorial_step = tutorial_steps(:one)
  end

  test "should get index" do
    get tutorial_steps_url
    assert_response :success
  end

  test "should get new" do
    get new_tutorial_step_url
    assert_response :success
  end

  test "should create tutorial_step" do
    assert_difference('TutorialStep.count') do
      post tutorial_steps_url, params: { tutorial_step: { position: @tutorial_step.position, text: @tutorial_step.text, title: @tutorial_step.title } }
    end

    assert_redirected_to tutorial_step_url(TutorialStep.last)
  end

  test "should show tutorial_step" do
    get tutorial_step_url(@tutorial_step)
    assert_response :success
  end

  test "should get edit" do
    get edit_tutorial_step_url(@tutorial_step)
    assert_response :success
  end

  test "should update tutorial_step" do
    patch tutorial_step_url(@tutorial_step), params: { tutorial_step: { position: @tutorial_step.position, text: @tutorial_step.text, title: @tutorial_step.title } }
    assert_redirected_to tutorial_step_url(@tutorial_step)
  end

  test "should destroy tutorial_step" do
    assert_difference('TutorialStep.count', -1) do
      delete tutorial_step_url(@tutorial_step)
    end

    assert_redirected_to tutorial_steps_url
  end
end
