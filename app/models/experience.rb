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

  validate :no_end_date_if_current

  def no_end_date_if_current
    if current
      binding.pry
      end_date == nil
    end
  end

  def location
    "#{company_city}, #{company_state}"
  end

  ######## Allow users to format the date however they wish ########
  def flexible_date
    dates = Hash.new({})
    dates[:start_date] = {
      month: self.start_date.strftime("%B"),
      year: self.start_date.year
    }

    if self.end_date
      dates[:end_date] = {
        month: self.end_date.strftime("%B"),
        year: self.end_date.year
      }
    end

    dates
  end

  def formatted_date
    formatted_dates = {}
    flexible_dates = flexible_date
    date_periods = flexible_dates.keys.map { |period| period }

    date_periods.each do |period|
      date_period = flexible_dates[period]
      formatted_dates[period] = "#{date_period[:month]} #{date_period[:year]}"
    end

    formatted_dates
  end

  def self.us_states
  [
    ['Alabama', 'AL'],
    ['Alaska', 'AK'],
    ['Arizona', 'AZ'],
    ['Arkansas', 'AR'],
    ['California', 'CA'],
    ['Colorado', 'CO'],
    ['Connecticut', 'CT'],
    ['Delaware', 'DE'],
    ['District of Columbia', 'DC'],
    ['Florida', 'FL'],
    ['Georgia', 'GA'],
    ['Hawaii', 'HI'],
    ['Idaho', 'ID'],
    ['Illinois', 'IL'],
    ['Indiana', 'IN'],
    ['Iowa', 'IA'],
    ['Kansas', 'KS'],
    ['Kentucky', 'KY'],
    ['Louisiana', 'LA'],
    ['Maine', 'ME'],
    ['Maryland', 'MD'],
    ['Massachusetts', 'MA'],
    ['Michigan', 'MI'],
    ['Minnesota', 'MN'],
    ['Mississippi', 'MS'],
    ['Missouri', 'MO'],
    ['Montana', 'MT'],
    ['Nebraska', 'NE'],
    ['Nevada', 'NV'],
    ['New Hampshire', 'NH'],
    ['New Jersey', 'NJ'],
    ['New Mexico', 'NM'],
    ['New York', 'NY'],
    ['North Carolina', 'NC'],
    ['North Dakota', 'ND'],
    ['Ohio', 'OH'],
    ['Oklahoma', 'OK'],
    ['Oregon', 'OR'],
    ['Pennsylvania', 'PA'],
    ['Puerto Rico', 'PR'],
    ['Rhode Island', 'RI'],
    ['South Carolina', 'SC'],
    ['South Dakota', 'SD'],
    ['Tennessee', 'TN'],
    ['Texas', 'TX'],
    ['Utah', 'UT'],
    ['Vermont', 'VT'],
    ['Virginia', 'VA'],
    ['Washington', 'WA'],
    ['West Virginia', 'WV'],
    ['Wisconsin', 'WI'],
    ['Wyoming', 'WY']
  ]
end

end
