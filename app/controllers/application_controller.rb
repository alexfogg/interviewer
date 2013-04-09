class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate

  private
  def authenticate
    @auth = (session[:user_id].present?) ? User.find(session[:user_id]) : nil
  end

  def only_authenticated_users
    redirect_to(root_path) if @auth.nil?
  end
end
