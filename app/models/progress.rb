# == Schema Information
#
# Table name: progresses
#
#  id           :integer          not null, primary key
#  num_right    :integer          default(0)
#  num_wrong    :integer          default(0)
#  percentage   :float
#  interview_id :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Progress < ActiveRecord::Base
  attr_accessible :num_right, :num_wrong, :interview_id, :percentage, :user_id
  belongs_to :interview
  belongs_to :user

  def last_score
    total = self.num_right.to_f + self.num_wrong.to_f
    100 * (self.num_right.to_f / total)
  end




end
