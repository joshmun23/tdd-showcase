require 'rails_helper'

feature %(
  As a user,
  I want to create an experience,
  so that I can showcase my experience to other developers.
) do

  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  scenario 'user creates a valid project' do

  end

  scenario 'user creates an invalid project' do
  end
end



