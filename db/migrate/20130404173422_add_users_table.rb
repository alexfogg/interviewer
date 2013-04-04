class AddUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password_digest
      t.text :image
      t.text :address
      t.string :phone
      t.decimal :balance, :default => 0
      t.boolean :is_house, :default => false
      t.timestamps
    end
  end
end