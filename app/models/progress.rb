# == Schema Information
#
# Table name: progresses
#
#  id           :integer          not null, primary key
#  num_right    :integer
#  num_wrong    :integer
#  percentage   :decimal(, )
#  interview_id :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Progress < ActiveRecord::Base
  attr_accessible :num_right, :num_wrong, :interview_id, :percentage, :user_id
  belongs_to :interview
end
