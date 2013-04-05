class AddThresholdColumnToInterviewsTable < ActiveRecord::Migration
 def change
    add_column :interviews, :threshold, :decimal
  end
end