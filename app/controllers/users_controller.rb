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
    u = User.all
    respond_to do |format|
      format.html
      format.js {render :json => u}
    end
  end


end
