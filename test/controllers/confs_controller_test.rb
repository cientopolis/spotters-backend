require 'test_helper'

class ConfsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conf = confs(:one)
  end

  test "should get index" do
    get confs_url
    assert_response :success
  end

  test "should get new" do
    get new_conf_url
    assert_response :success
  end

  test "should create conf" do
    assert_difference('conf.count') do
      post confs_url, params: { conf: { bounds: @conf.bounds, center: @conf.center, heading_center: @conf.heading_center, pitch_center: @conf.pitch_center, proximity_distance: @conf.proximity_distance, title: @conf.title, zoom: @conf.zoom } }
    end

    assert_redirected_to conf_url(conf.last)
  end

  test "should show conf" do
    get conf_url(@conf)
    assert_response :success
  end

  test "should get edit" do
    get edit_conf_url(@conf)
    assert_response :success
  end

  test "should update conf" do
    patch conf_url(@conf), params: { conf: { bounds: @conf.bounds, center: @conf.center, heading_center: @conf.heading_center, pitch_center: @conf.pitch_center, proximity_distance: @conf.proximity_distance, title: @conf.title, zoom: @conf.zoom } }
    assert_redirected_to conf_url(@conf)
  end

  test "should destroy conf" do
    assert_difference('conf.count', -1) do
      delete conf_url(@conf)
    end

    assert_redirected_to confs_url
  end
end
