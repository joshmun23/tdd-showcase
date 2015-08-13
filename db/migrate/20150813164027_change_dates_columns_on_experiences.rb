class ChangeDatesColumnsOnExperiences < ActiveRecord::Migration
  def up
    change_column :experiences, :start_date, :date, required: true
    change_column :experiences, :end_date, :date
  end

  def down
    change_column :experiences, :start_date, :datetime, required: true
    change_column :experiences, :end_date, :datetime
  end
end
