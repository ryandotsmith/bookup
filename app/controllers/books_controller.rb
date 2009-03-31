class BooksController < ApplicationController

  def index
    @books = Book.find(:all)
  end
  
  def new
    @book = Book.new
    respond_to do |format|
      format.html # new.html.erb
    end    
  end

  def create
    @book = Book.new( params[:book] )
    respond_to do |format|
      if @book.save
        flash[:notice] = 'Idea was successfully created.'
        format.html { redirect_to @book }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def show
    @book = Book.find(params[:id])
  end#method_name
  
end
