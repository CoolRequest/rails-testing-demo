require 'rails_helper'

RSpec.describe "Managing To-dos", type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  it "Create and display a to-do" do
    visit "/to_dos"

    click_on "New to-do"

    expect(page).to have_text "New to-do"

    fill_in "Title", with: "do the thing"
    click_on "Save"

    expect(page).to have_text "To do was successfully created."
    expect(page).to have_text "do the thing"
  end
end
