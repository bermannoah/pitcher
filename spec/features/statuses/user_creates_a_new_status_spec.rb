require 'rails_helper'

RSpec.describe "User can make a new status" do
  scenario "a user can see the new status button" do
    user = Fabricate(:user)
    status = Fabricate(:status, title: "New")
    pitch = Fabricate(:pitch, user: user, status: status)
    
    visit root_path
    click_link "Login"
    
    fill_in "email", with: "#{user.email}"
    fill_in "password", with: "#{user.password}"

    click_button "Submit"
    
    click_link "#{user.name}"
    click_link "#{pitch.title}"
    
    expect(page).to have_content("Status: New")
    expect(page).to have_content("Create Status")
  end
end
     
