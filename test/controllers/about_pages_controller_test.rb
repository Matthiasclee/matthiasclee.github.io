require "test_helper"

class AboutPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @about_page = about_pages(:one)
  end

  test "should get index" do
    get about_pages_url
    assert_response :success
  end

  test "should get new" do
    get new_about_page_url
    assert_response :success
  end

  test "should create about_page" do
    assert_difference('AboutPage.count') do
      post about_pages_url, params: { about_page: {  } }
    end

    assert_redirected_to about_page_url(AboutPage.last)
  end

  test "should show about_page" do
    get about_page_url(@about_page)
    assert_response :success
  end

  test "should get edit" do
    get edit_about_page_url(@about_page)
    assert_response :success
  end

  test "should update about_page" do
    patch about_page_url(@about_page), params: { about_page: {  } }
    assert_redirected_to about_page_url(@about_page)
  end

  test "should destroy about_page" do
    assert_difference('AboutPage.count', -1) do
      delete about_page_url(@about_page)
    end

    assert_redirected_to about_pages_url
  end
end
