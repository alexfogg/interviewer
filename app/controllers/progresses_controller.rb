class ProgressesController < ApplicationController


def index
end

def create

  @interview = Interview.find(params[:interview_id])
  @answers = params[:answer_ids].map do |i| Answer.find(i) end

  @answer_ids = @answers.map do |i| (i.id.to_i) end
  @answer_ids.sort!

  @question = Question.find(@answers.first.question_id)

  @question_id = @question.id

    correct_answers = @question.answers.where(:is_correct => true)
    @correct_answers_ids = correct_answers.map do |i| i.id end
      @correct_answers_ids.sort!

    @progress = Progress.find(params[:progress_id])

    if @correct_answers_ids == @answers_ids
      @progress.num_right += 1
    else
      @progress.num_wrong += 1
    end
      binding.pry

end





end
