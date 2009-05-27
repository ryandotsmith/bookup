class BooksController < ApplicationController
  #autocomplete_for :tags, :tag_list
  before_filter :authenticate, :except => [:index,:show,:home]
  before_filter :load_user

  def autocomplete_tag_list
    @tags = Book.suggest_tags( params )
    render :inline => @tags
  end
  def home
    render :layout => 'home'
  end
  
  def index
    params[:q] ||= 'discipline'
    @books_hash = Book.find_and_sort( params )
  end
  
  def new
    @book = @user.books.build
    respond_to do |format|
      format.html # new.html.erb
    end    
  end

  def create
    @book = @user.books.build( params[:book] )
    respond_to do |format|
      if @book.fetch_attrs_from_amazon() && @book.save
        flash[:success] = 'Book was successfully added to list'
        format.html { redirect_to edit_book_path(@book) }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def show
    @book = Book.find( params[:id] )
  end#method_name
  
  def edit
    @book = Book.find( params[:id] )
  end
  
  def update
    @book = Book.find( params[:id] )
    if @book.update_attributes( params[:book] )
      flash[:success] = "upaded the book."
      redirect_to @book
    else
      render :action => 'edit'
    end
  end

  def lookup
    isbn = params[:isbn]
    @book = Book.new(:isbn => isbn)
    if @book.scrub_isbn()
      @book.fetch_attrs_from_amazon()
      render :text => "<p>#{@book.title}</p>"
    else
      render :text => "<p>could not find book with that ISBN</p>"
    end
  end#lookup

protected
  
  def load_user
    @user = current_user
  end

end#class

