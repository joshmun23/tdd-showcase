class AddCurrentColumnToExperience < ActiveRecord::Migration
  def up
    add_column :experiences, :current, :boolean, null: false
  end

  def down
    remove_column :experiences, :current
  end
end
