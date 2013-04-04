# == Schema Information
#
# Table name: interviews
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  cost        :decimal(, )
#  progress_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Interview < ActiveRecord::Base
  attr_accessible :name, :cost, :progress_id, :user_id
  has_one :progress
end
