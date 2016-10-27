require 'rails_helper'

RSpec.describe "User can create a pitch" do
  scenario "a user is logged in and can create a pitch" do
    user = Fabricate(:user)
    status = Fabricate(:status)
    pitch = Fabricate(:pitch, user: user, status: status)
    
    visit root_path
    click_link "Login"
    
    fill_in "email", with: "#{user.email}"
    fill_in "password", with: "#{user.password}"

    click_button "Submit"
    expect(page).to have_content("Signed in as #{user.name}")

    visit new_user_pitch_path(user)

    expect(page).to have_content "Create a new pitch!"

    fill_in "pitch[title]", with: "#{pitch.title}"
    fill_in "pitch[content]", with: "#{pitch.content}"
    
    click_button "Create Pitch"
    click_link "#{user.name}"

    expect(page).to have_content("#{pitch.title}")
  end
end