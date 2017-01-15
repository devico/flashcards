class AddFactorProbeRepetitionToCard < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :factor, :float, :default => 2.5
    add_column :cards, :probe, :integer, :default => 1
    add_column :cards, :repetition, :integer
  end
end
