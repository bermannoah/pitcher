require 'rails_helper'

RSpec.describe "User must be logged in to create a pitch" do
  scenario "a user is not logged in and cannot create a pitch" do    
    user = Fabricate(:user)
    
    visit new_user_pitch_path(user)

    expect(page).to have_content "Login"
  end
  
  scenario "a user is logged in and can see the new pitch form" do
    user = Fabricate(:user)
    
    visit root_path
    click_link "Login"
    
    fill_in "email", with: "#{user.email}"
    fill_in "password", with: "#{user.password}"

    click_button "Submit"
    expect(page).to have_content("Signed in as #{user.name}")

    visit new_user_pitch_path(user)

    expect(page).to have_content "Create a new pitch!"
    expect(page).to have_content "Title"
    expect(page).to have_content "Content"
  end
end