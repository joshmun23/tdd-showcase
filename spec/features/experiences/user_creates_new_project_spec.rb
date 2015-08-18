require 'rails_helper'

feature %(
  As a user,
  I want to create an experience,
  so that I can showcase my experience to other developers.
) do

  before(:each) do
    @user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Log in'
  end

  scenario 'user creates a valid current experience' do
    visit new_user_experience_path(@user)

    expect(page).to have_css('section.new-form')
    expect(page).to have_css('section.new-form header h3')
    expect(page).to have_content('Add New Experience')
    expect(page).to have_css('.new-form form')

    within :css, 'section.new-form form' do
      fill_in 'Title', with: 'Full-Stack Web Developer'
      fill_in 'Company name', with: 'LeaseQ'
      fill_in 'Company city', with: 'Woburn'
      select 'MA', from: 'Company state'
      page.select 'June', :from => 'experience_start_date_2i'
      page.select '2015', :from => 'experience_start_date_1i'

      # page.select '1', :from => 'experience_end_date_3i'
      # page.select 'August', :from => 'experience_end_date_2i'
      # page.select '2015', :from => 'experience_end_date_1i'

      # need to add javascript testing tools to run script
      click_button 'Submit'
    end

    expect(page).to have_content('Experience successfully added')

    within :css, 'section#experiences-list' do
      experience = @user.experiences.last
      start_date = experience.flexible_date[:start_date]
      end_date   = experience.flexible_date[:end_date]

      expect(page).to have_content experience.title
      expect(page).to have_content experience.location
      #check for current experience
      expect(page).to have_content 'Current'
      expect(page).to have_content "#{start_date[:month]} #{start_date[:year]}"
    end
  end

  scenario 'user creates an invalid project (submits a blank form)' do
    visit new_user_experience_path(@user)
    within :css, 'section.new-form form' do
      click_button 'Submit'
    end
    expect(page).to have_content("Company name can't be blank, Company city can't be blank, Title can't be blank
")
  end
end



