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
    it { should validate_presence_of :end_date }
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

describe Experience, '#formatted_date' do
  before(:each) do
    @experience = FactoryGirl.create(:experience)
  end
  context 'returns a hash with containing variables for flexibility' do
    it 'returns an object of the Hash class' do
      expect(@experience.formatted_date.class).to eq Hash
    end
  end
end
