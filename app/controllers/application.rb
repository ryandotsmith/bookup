# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Clearance::App::Controllers::ApplicationController

  helper :all # include all helpers, all the time



  protect_from_forgery # :secret => '944a6866500479b811186bdd64df51a2'
  
  
  ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    %(<div class='red_ex'>) + html_tag + %(</div)
  end

end
