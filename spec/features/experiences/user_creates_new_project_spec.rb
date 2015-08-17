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

      # Page should not have End Date if the default current value is set
      # expect(page).to_not have_content('End date')
      # Page should have End Date if user checks the current box
      # check 'Current'
      # expect(page).to have_content('End date')

      # page.select '1', :from => 'experience_end_date_3i'
      # page.select 'August', :from => 'experience_end_date_2i'
      # page.select '2015', :from => 'experience_end_date_1i'

      click_button 'Submit'

    end

    expect(page).to have_content('Experience successfully added')

    within :css, 'section#experiences-list' do
      expect(page).to have_content('Full-Stack Web Developer')
      expect(page).to have_content('LeaseQ')
      expect(page).to have_content('Woburn')
      expect(page).to have_content('MA')
    end
  end

  scenario 'user creates an invalid project (submits a blank form)' do
    visit new_user_experience_path(@user)
    #start and end date years should not be past the current year
    within :css, 'section.new-form form' do
      select 'MA', from: 'Company state'
      page.select 'June', :from => 'experience_start_date_2i'
      page.select '2015', :from => 'experience_start_date_1i'

      # Page should not have End Date if the default current value is set
      # expect(page).to_not have_content('End date')
      # Page should have End Date if user checks the current box
      # check 'Current'
      # expect(page).to have_content('End date')

      # page.select '1', :from => 'experience_end_date_3i'
      # page.select 'August', :from => 'experience_end_date_2i'
      # page.select '2015', :from => 'experience_end_date_1i'

      click_button 'Submit'
    end
    expect(page).to have_content("Company name can't be blank, Company city can't be blank, Title can't be blank
")
  end
end



