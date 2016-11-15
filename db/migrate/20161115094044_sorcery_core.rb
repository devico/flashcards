class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username,             :null => false
      t.string :email,                    :default => nil
      t.string :crypted_password
      t.string :salt

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
