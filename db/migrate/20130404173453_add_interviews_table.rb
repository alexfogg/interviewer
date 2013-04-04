class AddInterviewsTable < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.string :name
      t.decimal :cost
      t.integer :progress_id
      t.integer :user_id
      t.timestamps
    end
  end
end