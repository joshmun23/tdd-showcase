class ChangeCurrentColumnOnExperiences < ActiveRecord::Migration
  def up
    change_column :experiences, :current, :boolean, default: true
  end

  def down
    change_column :experiences, :current, :boolean, default: false
  end
end
