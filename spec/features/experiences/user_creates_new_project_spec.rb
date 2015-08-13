require 'rails_helper'

feature %(
  As a user,
  I want to create an experience,
  so that I can showcase my experience to other developers.
) do

  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  scenario 'user creates a valid experience' do
    visit new_user_experience_path(@user) # "/users/#{@user.id}/projects"

    # expect('section#top-header h3').to_have header("Add Experience")
    expect(page).to have_css('section.new-form')
    expect(page).to have_css('section.new-form header h3')
    expect(page).to have_content('Add New Experience')
  end

  scenario 'user creates an invalid project' do
  end
end



