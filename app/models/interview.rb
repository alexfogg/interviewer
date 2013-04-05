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
end
