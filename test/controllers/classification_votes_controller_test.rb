require 'test_helper'

class ClassificationVotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @classification_vote = classification_votes(:one)
  end

  test "should get index" do
    get classification_votes_url
    assert_response :success
  end

  test "should get new" do
    get new_classification_vote_url
    assert_response :success
  end

  test "should create classification_vote" do
    assert_difference('ClassificationVote.count') do
      post classification_votes_url, params: { classification_vote: { classification_id: @classification_vote.classification_id, positive: @classification_vote.positive, user_id: @classification_vote.user_id } }
    end

    assert_redirected_to classification_vote_url(ClassificationVote.last)
  end

  test "should show classification_vote" do
    get classification_vote_url(@classification_vote)
    assert_response :success
  end

  test "should get edit" do
    get edit_classification_vote_url(@classification_vote)
    assert_response :success
  end

  test "should update classification_vote" do
    patch classification_vote_url(@classification_vote), params: { classification_vote: { classification_id: @classification_vote.classification_id, positive: @classification_vote.positive, user_id: @classification_vote.user_id } }
    assert_redirected_to classification_vote_url(@classification_vote)
  end

  test "should destroy classification_vote" do
    assert_difference('ClassificationVote.count', -1) do
      delete classification_vote_url(@classification_vote)
    end

    assert_redirected_to classification_votes_url
  end
end
