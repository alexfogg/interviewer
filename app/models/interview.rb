# == Schema Information
#
# Table name: interviews
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  cost       :decimal(, )
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  threshold  :decimal(, )
#

class Interview < ActiveRecord::Base
  attr_accessible :name, :cost, :user_id, :threshold
  has_many :progresses
  has_and_belongs_to_many :tags
  has_many :questions
  belongs_to :user
  scope :filtered, where('user_id is null').order(:name)

  def avg_score
    r = self.progresses.map(&:num_right).inject(:+)
    w = self.progresses.map(&:num_wrong).inject(:+)
    t = r.to_f + w.to_f
    (r.to_f / t.to_f) * 100
  end

end
