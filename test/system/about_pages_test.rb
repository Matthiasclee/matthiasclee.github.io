require "application_system_test_case"

class AboutPagesTest < ApplicationSystemTestCase
  setup do
    @about_page = about_pages(:one)
  end

  test "visiting the index" do
    visit about_pages_url
    assert_selector "h1", text: "About Pages"
  end

  test "creating a About page" do
    visit about_pages_url
    click_on "New About Page"

    click_on "Create About page"

    assert_text "About page was successfully created"
    click_on "Back"
  end

  test "updating a About page" do
    visit about_pages_url
    click_on "Edit", match: :first

    click_on "Update About page"

    assert_text "About page was successfully updated"
    click_on "Back"
  end

  test "destroying a About page" do
    visit about_pages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "About page was successfully destroyed"
  end
end
