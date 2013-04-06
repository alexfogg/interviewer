class InterviewsController < ApplicationController

  def index
    @interviews = Interview.all
  end

  def new
    @interview = Interview.new
  end

  def filter
    user = User.find(params[:user_id])
    @interviews = user.interviews
  end

  def cost
    @interviews = Interview.where(:cost => params[:cost])
  end


  # def interviewchart
  #   i = @progresses.map do |progress|
  #     {'percentage' => progress.percentage, 'date' => progress.created_at}
  #   end

  def search
    query = params[:query]
    @interviews = Interview.where("name @@ :q", :q => query)

    tags = Tag.where("name @@ :q", :q => query)
    @interviews += tags.map(&:interviews).flatten
    @interviews.uniq!

    render :filter
  end

  def interviewchart
    i = @auth.progresses.map do |progress|
      {'num_right' => progress.num_right, 'date' => progress.created_at}
    end
    render :json => i
  end

  def analytics
    @users = User.all
    @progresses = Progress.all
    @interview = Interview.find(params[:id])
  end


  def create
    @interview = Interview.create(params[:interview])
    @auth.interviews << @interview

    tags = params[:tags].split(',')
    tags.each do |tag|
      tag = tag.squish
      t = Tag.where(name: tag).first
      t = Tag.new(name: tag) if t.nil?
      @interview.tags << t
    end
    @interviews = Interview.all
  end

  def show
    @interview = Interview.find(params[:id])
    @answer = Answer.new
    @progress = Progress.create
  end


end
