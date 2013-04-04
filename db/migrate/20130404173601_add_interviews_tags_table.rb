class AddInterviewsTagsTable < ActiveRecord::Migration
  def change
    create_table :interviews_tags, :id => false do |t|
      t.integer :interview_id
      t.integer :tag_id
    end
  end
end