# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  ####################
  #logged_in?
  def logged_in?
    @user = User.find(session[:user_id])
    !!@user
  end#logged_in?


end
