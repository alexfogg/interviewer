class AnswersController < ApplicationController

def new
  @question = Question.find(params[:question_id])
  @answer = Answer.new

end


def create

  @question = Question.find(params[:question_id])
  @answer = Answer.create(params[:answer])
  @question.answers << @answer

  id = @question.interview_id.to_s
  @interview = Interview.find(id)

end



end

