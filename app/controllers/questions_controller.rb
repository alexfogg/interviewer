class QuestionsController < ApplicationController


  def new

    interview = Interview.find(params[:interview_id])
    @question = Question.new
    # interview.questions << @question
  end

  def create
    @question = Question.create(params[:question])
    interview = Interview.find(params[:interview_id])
    interview.questions << @question
    binding.pry

  end

  def show
  end



end
