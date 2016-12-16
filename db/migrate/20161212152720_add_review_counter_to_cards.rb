class AddReviewCounterToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :success_counter, :integer, :default => 0
    add_column :cards, :fail_counter, :integer, :default => 0
  end
end
