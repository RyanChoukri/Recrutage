require 'test_helper'

class BuisinessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @buisiness = buisinesses(:one)
  end

  test "should get index" do
    get buisinesses_url
    assert_response :success
  end

  test "should get new" do
    get new_buisiness_url
    assert_response :success
  end

  test "should create buisiness" do
    assert_difference('Buisiness.count') do
      post buisinesses_url, params: { buisiness: { city: @buisiness.city, name: @buisiness.name } }
    end

    assert_redirected_to buisiness_url(Buisiness.last)
  end

  test "should show buisiness" do
    get buisiness_url(@buisiness)
    assert_response :success
  end

  test "should get edit" do
    get edit_buisiness_url(@buisiness)
    assert_response :success
  end

  test "should update buisiness" do
    patch buisiness_url(@buisiness), params: { buisiness: { city: @buisiness.city, name: @buisiness.name } }
    assert_redirected_to buisiness_url(@buisiness)
  end

  test "should destroy buisiness" do
    assert_difference('Buisiness.count', -1) do
      delete buisiness_url(@buisiness)
    end

    assert_redirected_to buisinesses_url
  end
end
