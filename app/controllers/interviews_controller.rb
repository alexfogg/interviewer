class InterviewsController < ApplicationController
  def index
    @interviews = Interview.all
  end

  def new
    @interview = Interview.new
  end

  def new
    @user = User.new
  end

  def create
    @interview = Interview.create(params[:interview])
    tags = params[:tags].split(',')
    tags.each do |tag|
      tag = tag.squish
      t = Tag.where(name: tag).first
      t = Tag.new(name: tag) if t.nil?
      @interview.tags << t
    end

    @interviews = Interview.filtered
  end


end
