require 'test_helper'

class CandidatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @candidate = candidates(:one)
  end

  test "should get index" do
    get candidates_url
    assert_response :success
  end

  test "should get new" do
    get new_candidate_url
    assert_response :success
  end

  test "should create candidate" do
    assert_difference('Candidate.count') do
      post candidates_url, params: { candidate: { candidate_type_id: @candidate.candidate_type_id, expert_id: @candidate.expert_id, heading: @candidate.heading, location: @candidate.location, owner_id: @candidate.owner_id, pitch: @candidate.pitch, status: @candidate.status } }
    end

    assert_redirected_to candidate_url(Candidate.last)
  end

  test "should show candidate" do
    get candidate_url(@candidate)
    assert_response :success
  end

  test "should get edit" do
    get edit_candidate_url(@candidate)
    assert_response :success
  end

  test "should update candidate" do
    patch candidate_url(@candidate), params: { candidate: { candidate_type_id: @candidate.candidate_type_id, expert_id: @candidate.expert_id, heading: @candidate.heading, location: @candidate.location, owner_id: @candidate.owner_id, pitch: @candidate.pitch, status: @candidate.status } }
    assert_redirected_to candidate_url(@candidate)
  end

  test "should destroy candidate" do
    assert_difference('Candidate.count', -1) do
      delete candidate_url(@candidate)
    end

    assert_redirected_to candidates_url
  end
end
