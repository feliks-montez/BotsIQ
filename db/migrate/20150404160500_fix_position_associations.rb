class FixPositionAssociations < ActiveRecord::Migration
  def change
    remove_column :positions, :user_id, :integer
    add_column :users, :position_id, :integer
  end
end
