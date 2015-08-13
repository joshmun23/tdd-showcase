require 'rails_helper'
require 'pry'

RSpec.describe Experience, type: :model do
  before(:each) do
    # @user = FactoryGirl.create(:user) do |user|
    #   user.experiences.FactoryGirl.create(:experience)
    # end
    @experience = FactoryGirl.create(:experience)
  end

  context 'has valid attributes' do
    it { should be_a Experience }
    it { should belong_to :user }
    it { should validate_presence_of :company_name }
    it { should validate_presence_of :company_city }
    it { should validate_presence_of :company_state }
    it { should validate_presence_of :start_date }
    it { should validate_presence_of :title }
  end
end

describe Experience, '#location' do
  before(:each) do
    @experience = FactoryGirl.create(:experience)
  end

  it 'returns the concatenated company location' do
    expect(@experience.location).to eq(
      "#{@experience.company_city}, #{@experience.company_state}"
    )
  end
end

describe Experience, '#flexible_date' do
  before(:each) do
    @experience = FactoryGirl.create(:experience)
    @current_experience = FactoryGirl.create(:experience, end_date: nil, current: true)
    @flexible_date = @experience.flexible_date
  end

  context 'returns a hash with containing variables for flexibility' do
    it 'returns an object of the Hash class' do
      expect(@experience.flexible_date.class).to eq Hash
    end
    it 'does not return end_date values if current experience' do
      expect(@current_experience.current).to eq true
      expect(@current_experience.flexible_date[:end_date].count).to eq 0
    end
  end

  context 'provides the user with start date variables' do
    before(:each) do
      @flexible_date = @experience.flexible_date
    end

    it 'returns start month' do
      expect(@flexible_date[:start_date][:month]).to eq @experience.start_date.month
    end

    it 'returns start year' do
      expect(@flexible_date[:start_date][:year]).to eq @experience.start_date.year
    end
  end

  context 'provides the user with end date variables' do
    it 'returns end month' do
      expect(@flexible_date[:end_date][:month]).to eq @experience.end_date.month
    end

    it 'returns end year' do
      expect(@flexible_date[:end_date][:year]).to eq @experience.end_date.year
    end
  end
end
