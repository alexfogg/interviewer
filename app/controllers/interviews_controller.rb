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

  def interviewchart
    chartdata = []
    Interview.all.each do |interview|
      interview.progresses.each do |progress|
        chartdata << {'percentage' => progress.percentage, 'date' => progress.created_at}
      end
    end
    render :json => chartdata
  end

  def search
    query = params[:query]
    @interviews = Interview.where("name @@ :q", :q => query)

    tags = Tag.where("name @@ :q", :q => query)
    @interviews += tags.map(&:interviews).flatten
    @interviews.uniq!
    render :filter
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
end

