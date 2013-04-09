# == Schema Information
#
# Table name: questions
#
#  id           :integer          not null, primary key
#  question     :text
#  category     :string(255)
#  interview_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Question < ActiveRecord::Base
  attr_accessible :question, :category, :interview_id
  has_many :answers
  belongs_to :interview


  def correct
      correct_answers = self.answers.where(:is_correct => true).map  do |i|
       i.id end
      correct_answers.sort!
  end




end

