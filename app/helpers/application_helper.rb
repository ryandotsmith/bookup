# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  ####################
  #logged_in?
  def logged_in?
    @user = current_user
  end#logged_in?

  def get_css( controller )
    [controller.controller_name, 'application','jquery.autocomplete','humanity']
  end#get_css


  ####################
  #get_js
  def get_js
    [ 'jquery.min.js',
        'jquery-ui.min.js',
          'jquery.corner.js',
              'jquery.tablesorter.min.js',
                'jrails',
                  'jquery.autocomplete.js',
                      'application.js']
  end#get_js

  ####################
  #scribble( attr )
  def scribble( attr )
   user =  attr.scan(/^([^@]+)(@.*)$/).flatten.first
   domain = attr.scan(/^([^@]+)(@.*)$/).flatten.second
   user[0..1] + "..." + user[-1..-1] + domain
  end#scribble( attr )
  ####################
  #shorten
  def shorten( attr )
    return short_attr = attr[0..24] + "... " if attr.length >= 24
    attr
  end#shorten

  def dollar_sign( number )
    "$" + "%.2f" % number 
  end

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
