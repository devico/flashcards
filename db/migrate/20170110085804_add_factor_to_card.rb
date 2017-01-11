class AddFactorToCard < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :factor, :float, default: 2.5
  end
end
