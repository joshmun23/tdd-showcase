class Experience < ActiveRecord::Base
  belongs_to :user

  validates :company_name,
    presence: true
  validates :company_city,
    presence: true
  validates :company_state,
    presence: true
  validates :start_date,
    presence: true
  #do not validate end date because a user may currently be working there
  validates :title,
    presence: true

  def location
    "#{company_city}, #{company_state}"
  end

  def flexible_date
    dates = Hash.new({})

    dates[:start_date] = {
      day: self.start_date.day,
      month: self.start_date.month,
      year: self.start_date.year
    }

    dates
  end
end
