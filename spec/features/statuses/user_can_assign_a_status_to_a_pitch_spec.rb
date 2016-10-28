require 'rails_helper'

RSpec.describe "User can assign a status to a pitch" do
  scenario "a user can assign a status to a new pitch" do
    user = Fabricate(:user)
    status = Fabricate(:status, title: "New")
    status_2 = Fabricate(:status, title: "Old")
    
    visit root_path
    click_link "Login"
    
    fill_in "email", with: "#{user.email}"
    fill_in "password", with: "#{user.password}"

    click_button "Submit"
    
    click_link "#{user.name}"
    click_link "Create a new pitch"
    
    fill_in "pitch[title]", with: "Test Pitch"
    fill_in "pitch[content]", with: "Hello World!"
    find(:xpath, '//option[contains(text(), "Old")]').select_option
    
    click_button "Create Pitch"
    
    expect(page).to have_content("Test Pitch")
    expect(page).to have_content("Old")
    
  end
end