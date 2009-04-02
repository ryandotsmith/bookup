module ListingsHelper

  ####################
  #get_market_status( listing )
  def get_market_status( listing )
    case listing.market_status
      when -1
        "<a style='color:red'>sold</a>"
      when 0
        "<a style='color:orange'>pending</a>"
      when 1
        "<a style='color:#45C84C'>available</a>"
    end
  end#get_market_status( book )
end
