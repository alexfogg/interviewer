class ProgressesController < ApplicationController


def index
end

def create
  @interview = Interview.find(params[:interview_id])
  @answers = Answer.find(params[:answer_ids]).map do |i|
    Answer.find(i)
  end
    @question = Question.find(@answers.first.question_id)
    correct_answers = @question.answers.where(:is_correct => true)
    @progress = Progress.find(params[:progress_id])

    if correct_answers == @answers
      @progress.num_right += 1
    else
      @progress.num_wrong += 1
    end
    binding.pry
end





end
