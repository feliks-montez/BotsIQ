class AddPositionsAssociations < ActiveRecord::Migration
  def change
    add_column :positions, :user_id, :integer, index: true
    add_column :positions, :team_id, :integer, index: true
    remove_column :users, :position, :string
  end
end
