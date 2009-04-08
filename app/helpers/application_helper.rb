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
    ['style','humanity','tablesorter','table','form','list']
  end#get_css
  ####################
  #get_js
  def get_js
    [ 'jquery.min.js',
        'jquery-ui.min.js',
          'jquery.corner.js',
            'application.js',
              'jquery.tablesorter.min.js',
                'jrails']
  end#get_js

  ####################
  #scribble( attr )
  def scribble( attr )
   user =  attr.scan(/^([^@]+)(@.*)$/).flatten.first
   domain = attr.scan(/^([^@]+)(@.*)$/).flatten.second
   user[0..1] + "..." + user[-1..-1] + domain
  end#scribble( attr )

  def clippy(text, bgcolor='#FFFFFF')
    html = <<-EOF
      <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
              width="110"
              height="14"
              id="clippy" >
      <param name="movie" value="/flash/clippy.swf"/>
      <param name="allowScriptAccess" value="always" />
      <param name="quality" value="high" />
      <param name="scale" value="noscale" />
      <param NAME="FlashVars" value="text=#{text}">
      <param name="bgcolor" value="#{bgcolor}">
      <embed src="/flash/clippy.swf"
             width="110"
             height="14"
             name="clippy"
             quality="high"
             allowScriptAccess="always"
             type="application/x-shockwave-flash"
             pluginspage="http://www.macromedia.com/go/getflashplayer"
             FlashVars="text=#{text}"
             bgcolor="#{bgcolor}"
      />
      </object>
    EOF
  end
  

end
