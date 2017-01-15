class AddProbeToCard < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :probe, :integer, :default => 1
  end
end
