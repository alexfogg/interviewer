class QuestionsController < ApplicationController
  def new

    @interview = Interview.find(params[:interview_id])
    @question = Question.new
  end

  def create
    @question = Question.create(params[:question])
    @interview = Interview.find(params[:interview_id])
    @interview.questions << @question
    @answer = Answer.new

  end

  def show
  end



end
