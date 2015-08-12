class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.integer :user_id
      t.string :company_name
      t.string :company_city
      t.string :company_state
      t.datetime :start_date
      t.datetime :end_date
      t.string :title

      t.timestamps
    end
  end
end
