class RemoveProgressIdColumnInInterviewsTable < ActiveRecord::Migration
  def change
     remove_column :interviews, :progress_id
  end
end