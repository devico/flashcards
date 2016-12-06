class AddCurrentDeckToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :current_deck_id, :integer
  end
end
