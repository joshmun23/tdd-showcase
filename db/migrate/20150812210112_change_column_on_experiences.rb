class ChangeColumnOnExperiences < ActiveRecord::Migration
  def change
    change_column :experiences, :current, :boolean, default: false
  end
end
