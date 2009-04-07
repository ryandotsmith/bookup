class BooksController < ApplicationController
  before_filter :authenticate, :except => [:index,:show]
  before_filter :load_user
  def index
    @books = Book.find(:all)
  end
  
  def new
    @book = @user.books.build
    respond_to do |format|
      format.html # new.html.erb
    end    
  end

  def create
    @book = @user.books.build( params[:book] )
    @book.fetch_attrs_from_amazon()
    respond_to do |format|
      if @book.save
        flash[:notice] = 'Book was successfully added to list'
        format.html { redirect_to books_path }
      else
        flash[:notice] = 'Book was not added.'
        format.html { render :action => "new" }
      end
    end
  end
  
  def show
    @book = Book.find( params[:id] )
  end#method_name

  def lookup
    isbn = params[:isbn]
    @book = Book.new(:isbn => isbn)
    if @book.scrub_isbn()
      @book.fetch_attrs_from_amazon()
      render :text => "#{@book.title}"
    else
      render :text => "could not find book with that ISBN"
    end
  end#lookup

protected
  
  def load_user
    @user = current_user
  end

end#class

