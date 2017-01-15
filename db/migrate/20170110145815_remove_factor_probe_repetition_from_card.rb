class RemoveFactorProbeRepetitionFromCard < ActiveRecord::Migration[5.0]
  def change
    remove_column :cards, :factor
    remove_column :cards, :probe
    remove_column :cards, :repetition
  end
end
