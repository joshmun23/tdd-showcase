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

  def formatted_date
    dates = {
      start_date: start_date,
      end_date: end_date
    }

    dates
  end
end
