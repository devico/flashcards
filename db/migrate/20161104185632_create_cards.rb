class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :original_text
      t.string :translated_text
      t.string :review_date
    end
  end
end
