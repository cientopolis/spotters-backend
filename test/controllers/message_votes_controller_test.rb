require 'test_helper'

class MessageVotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message_vote = message_votes(:one)
  end

  test "should get index" do
    get message_votes_url
    assert_response :success
  end

  test "should get new" do
    get new_message_vote_url
    assert_response :success
  end

  test "should create message_vote" do
    assert_difference('MessageVote.count') do
      post message_votes_url, params: { message_vote: { message_id: @message_vote.message_id, positive: @message_vote.positive, user_id: @message_vote.user_id } }
    end

    assert_redirected_to message_vote_url(MessageVote.last)
  end

  test "should show message_vote" do
    get message_vote_url(@message_vote)
    assert_response :success
  end

  test "should get edit" do
    get edit_message_vote_url(@message_vote)
    assert_response :success
  end

  test "should update message_vote" do
    patch message_vote_url(@message_vote), params: { message_vote: { message_id: @message_vote.message_id, positive: @message_vote.positive, user_id: @message_vote.user_id } }
    assert_redirected_to message_vote_url(@message_vote)
  end

  test "should destroy message_vote" do
    assert_difference('MessageVote.count', -1) do
      delete message_vote_url(@message_vote)
    end

    assert_redirected_to message_votes_url
  end
end
