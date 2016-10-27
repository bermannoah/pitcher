require 'rails_helper'

RSpec.describe "User can delete a pitch" do
  scenario "a user can see the delete button on list of pitches" do
    user = Fabricate(:user)
    pitch = Fabricate(:pitch, user: user)
    
    visit root_path
    click_link "Login"
    
    fill_in "email", with: "#{user.email}"
    fill_in "password", with: "#{user.password}"

    click_button "Submit"
    expect(page).to have_content("Signed in as #{user.name}")

    click_link "#{user.name}"

    expect(page).to have_content("#{pitch.title}")
    expect(page).to have_content("Delete Pitch")
  end
  
  scenario "a user can delete a pitch from the list of pitches" do
    user = Fabricate(:user)
    pitch = Fabricate(:pitch, user: user)
    
    visit root_path
    click_link "Login"
    
    fill_in "email", with: "#{user.email}"
    fill_in "password", with: "#{user.password}"

    click_button "Submit"
    expect(page).to have_content("Signed in as #{user.name}")

    click_link "#{user.name}"

    expect(page).to have_content("#{pitch.title}")
    
    click_link "Delete Pitch"

    expect(page).to_not have_content("#{pitch.title}")
    

  end
  
end