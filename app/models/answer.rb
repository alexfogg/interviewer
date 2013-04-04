# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  response    :text
#  is_correct  :boolean
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Answer < ActiveRecord::Base
  attr_accessible :response, :is_correct, :question_id
  belongs_to :question
end
