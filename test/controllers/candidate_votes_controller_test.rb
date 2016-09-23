require 'test_helper'

class CandidateVotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @candidate_vote = candidate_votes(:one)
  end

  test "should get index" do
    get candidate_votes_url
    assert_response :success
  end

  test "should get new" do
    get new_candidate_vote_url
    assert_response :success
  end

  test "should create candidate_vote" do
    assert_difference('CandidateVote.count') do
      post candidate_votes_url, params: { candidate_vote: { candidate_id: @candidate_vote.candidate_id, positive: @candidate_vote.positive, user_id: @candidate_vote.user_id } }
    end

    assert_redirected_to candidate_vote_url(CandidateVote.last)
  end

  test "should show candidate_vote" do
    get candidate_vote_url(@candidate_vote)
    assert_response :success
  end

  test "should get edit" do
    get edit_candidate_vote_url(@candidate_vote)
    assert_response :success
  end

  test "should update candidate_vote" do
    patch candidate_vote_url(@candidate_vote), params: { candidate_vote: { candidate_id: @candidate_vote.candidate_id, positive: @candidate_vote.positive, user_id: @candidate_vote.user_id } }
    assert_redirected_to candidate_vote_url(@candidate_vote)
  end

  test "should destroy candidate_vote" do
    assert_difference('CandidateVote.count', -1) do
      delete candidate_vote_url(@candidate_vote)
    end

    assert_redirected_to candidate_votes_url
  end
end
