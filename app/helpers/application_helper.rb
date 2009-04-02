# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  ####################
  #logged_in?
  def logged_in?
    @user = current_user
  end#logged_in?

  ####################
  #get_css
  def get_css
    ['style','humanity','tablesorter']
  end#get_css
  ####################
  #get_js
  def get_js
    [ 'jquery.min.js',
        'jquery-ui.min.js',
          'jquery.curvycorners.min.js',
            'application.js',
              'jquery.tablesorter.min.js']
  end#get_js
end
