require 'rails_helper'

RSpec.describe "User can edit a pitch" do
  scenario "a user can see the edit button on list of pitches" do
    user = Fabricate(:user)
    pitch = Fabricate(:pitch, user: user)
    
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
    expect(page).to have_content("Edit Pitch")
  end
  
  scenario "a user can go to the edit pitch page from the list of pitches" do
    user = Fabricate(:user)
    pitch = Fabricate(:pitch, user: user)

    visit root_path
    click_link "Login"
    
    fill_in "email", with: "#{user.email}"
    fill_in "password", with: "#{user.password}"

    click_button "Submit"
    expect(page).to have_content("Signed in as #{user.name}")

    click_link "#{user.name}"

    click_link "Edit Pitch"

    fill_in "pitch[title]", with: "Serious Gravitas Deficiency"
    
    click_button "Update Pitch"
    click_link "#{user.name}"
    
    expect(page).to have_content "Serious Gravitas Deficiency"
    expect(page).to_not have_content "#{pitch.title}"
  end
end