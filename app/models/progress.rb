# == Schema Information
#
# Table name: progresses
#
#  id           :integer          not null, primary key
#  num_right    :integer
#  num_wrong    :integer
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

  def total
    if self.num_right.to_i + self.num_wrong.to_i == 4
      return true
    end
  end


  def passing
    if self.percentage >= self.interview.threshold
      return true
    else
      return false
    end
  end

  def check(answer_ids)

    answers = Answer.find(answer_ids)

    answer_ids = answers.map do |i| (i.id.to_i) end

    answer_ids.sort!

    question = answers.first.question

    if question.correct == answer_ids
      self.num_right += 1
      self.percentage = self.last_score
      self.save
      true
    else
      self.num_wrong += 1
      self.percentage = self.last_score
      self.save
      false
    end


  end


end
