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
    Interview.find(params[:id]).progresses.each do |progress|
        chartdata << {'percentage' => progress.percentage, 'date' => progress.created_at}
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
    @interview = Interview.find(params[:id])
    @progresses = @interview.progresses
  end


  def create
    @interview = Interview.create(params[:interview])
    @auth.interviews << @interview



    @interview.tags = Tags.make_tags(params[:tags])

    @interviews = Interview.all
    end

  def show
    @interview = Interview.find(params[:id])
    @answer = Answer.new
    @progress = Progress.create
    if @auth.interviews.where(:id => @interview.id).present?
    @auth.interviews.where(:id => @interview.id).first.progresses << @progress
    @auth.progresses << @progress
  else
    @auth.interviews << @interview
      @auth.interviews.where(:id => @interview.id).first.progresses << @progress
    end
  end


  def purchase
    interview = Interview.find(params[:id])

    begin
      if @auth.customer_id.nil?
        customer = Stripe::Customer.create(email: @auth.email, card: params[:token])
        @auth.customer_id = customer.id
        @auth.save
      end
      Stripe::Charge.create(customer: @auth.customer_id, amount: (interview.cost * 100).to_i, description: interview.name, currency: 'usd')

    rescue Stripe::CardError => @error
    end

    if @error.nil?
      @auth.interviews << interview
      @auth.balance = @auth.balance.to_f - (interview.cost).to_f
      @auth.save
      Notifications.purchased_interview(@auth, interview).deliver
    end

    @interviews = Interview.filtered
  end

end

