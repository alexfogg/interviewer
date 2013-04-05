class QuestionsController < ApplicationController


  def new
    @question = Question.new
  end

  def create
    @question = Question.create(params[:question])
  end




end
