class AddPassingFailingToInterviewsTable < ActiveRecord::Migration
  def change
    add_column :interviews, :passing, :integer, :default => 0
    add_column :interviews, :failing, :integer, :default => 0
  end
end
