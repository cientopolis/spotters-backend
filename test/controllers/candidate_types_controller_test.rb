require 'test_helper'

class CandidateTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @candidate_type = candidate_types(:one)
  end

  test "should get index" do
    get candidate_types_url
    assert_response :success
  end

  test "should get new" do
    get new_candidate_type_url
    assert_response :success
  end

  test "should create candidate_type" do
    assert_difference('CandidateType.count') do
      post candidate_types_url, params: { candidate_type: { name: @candidate_type.name, points_confirmed: @candidate_type.points_confirmed, points_failure: @candidate_type.points_failure, points_rejected: @candidate_type.points_rejected, points_success: @candidate_type.points_success } }
    end

    assert_redirected_to candidate_type_url(CandidateType.last)
  end

  test "should show candidate_type" do
    get candidate_type_url(@candidate_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_candidate_type_url(@candidate_type)
    assert_response :success
  end

  test "should update candidate_type" do
    patch candidate_type_url(@candidate_type), params: { candidate_type: { name: @candidate_type.name, points_confirmed: @candidate_type.points_confirmed, points_failure: @candidate_type.points_failure, points_rejected: @candidate_type.points_rejected, points_success: @candidate_type.points_success } }
    assert_redirected_to candidate_type_url(@candidate_type)
  end

  test "should destroy candidate_type" do
    assert_difference('CandidateType.count', -1) do
      delete candidate_type_url(@candidate_type)
    end

    assert_redirected_to candidate_types_url
  end
end
