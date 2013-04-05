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


end
