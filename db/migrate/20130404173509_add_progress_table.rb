class AddProgressTable < ActiveRecord::Migration
  def change
    create_table :progresses do |t|
      t.integer :num_right
      t.integer :num_wrong
      t.float :percentage
      t.integer :interview_id
      t.integer :user_id
      t.timestamps
    end
  end
end