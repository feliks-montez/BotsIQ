class AddBasicRelations < ActiveRecord::Migration
  def change
    add_column :users, :team_id, :integer, index: true
    add_column :projects, :team_id, :integer, index: true
  end
end
