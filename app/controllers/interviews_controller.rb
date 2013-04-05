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

<<<<<<< HEAD
def interviewchart
    i = @auth.progresses.map do |progress|
      {'num_right' => progress.num_right, 'date' => progress.created_at}
    end 
    render :json => i
  end
=======
  def analytics
    @users = User.all
    @progresses = Progress.all
    @interview = Interview.find(params[:id])
  end

>>>>>>> 1e7285bb22c2c4f0a317b66341cfc7f29e27313f


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
