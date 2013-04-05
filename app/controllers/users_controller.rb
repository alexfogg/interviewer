class UsersController < ApplicationController

  def show
    @auth
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
  end

  def userchart
    u = @auth.progresses.map do |progress|
      {'num_right' => progress.num_right, 'date' => progress.created_at}
    end 
    render :json => u
  end
  

end
