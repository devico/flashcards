class AddRepetitionToCard < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :repetition, :integer
  end
end
