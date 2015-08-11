require 'rails_helper'

RSpec.describe Experience, type: :model do
  before(:each) do
    # @user = FactoryGirl.create(:user) do |user|
    #   user.experiences.FactoryGirl.create(:experience)
    # end
    @experience = FactoryGirl.create(:experience)
  end
  context 'has valid attributes' do
    it 'should be of the class Experience' do
      @experience.should be_a(Experience)
    end

    it 'should belong to a user' do
      @experience.should belong_to(:user)
    end

    it { should validate_presence_of :company_name }
    it { should validate_presence_of :company_city }
    it { should validate_presence_of :company_state }
    it { should validate_presence_of :start_date }
    it { should validate_presence_of :end_date }
  end

  context 'user creates an invalid experience' do

  end
end
