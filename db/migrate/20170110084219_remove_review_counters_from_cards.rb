class RemoveReviewCountersFromCards < ActiveRecord::Migration[5.0]
  def change
    remove_column :cards, :success_counter
    remove_column :cards, :fail_counter
  end
end
