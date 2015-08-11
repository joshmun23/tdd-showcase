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
  validates :end_date,
    presence: true
end
