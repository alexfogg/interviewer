class AddQuestionsTable < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question
      t.string :category
      t.integer :interview_id
      t.timestamps
    end
  end
end