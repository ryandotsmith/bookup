module AmazonProducts
  class Offer

    ####################
    #initialize( init )
    def initialize( item )
      @item = item.to_h
    end#initialize( init )
#product.to_h['item_lookup_response'].to_h['items'].to_h['item'].to_h['offers'].to_h['offer'].to_h['offer_listing'].to_h['price'].formatted_price.to_s.should eql("f")    
    ####################
    #offers
    def offers
      @item['offers'].to_h
    end#offers
  end

end