class ChangeProgressNumRightNumWrongTable < ActiveRecord::Migration
  def change
     change_column :progresses, :num_right, :integer, :default => 0
     change_column :progresses, :num_wrong, :integer, :default => 0
  end
end