class BookObserver < ActiveRecord::Observer

  def before_save( book )
    book.discipline_list << "Uncategorized"
  end
  
  def after_update( book )
    # on create we add "Uncategorized" to the discipline list 
    # if we update the book and add a new discipline tag, then we 
    # need to remove the "Uncategorized" tag. 
    if book.discipline_list.length > 1
      if book.discipline_list.include?("Uncategorized")
        book.discipline_list -= ["Uncategorized"]     
      end
    end
    # if the book does not have any discipline tag then add Uncategorized back.
    book.discipline_list << "Uncategorized" if book.discipline_list.length == 0
  end

end