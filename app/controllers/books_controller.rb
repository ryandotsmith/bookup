class BooksController < ApplicationController
  autocomplete_for :tags, :tag_list
  before_filter :authenticate, :except => [:index,:show]
  before_filter :load_user

  def autocomplete_tag_list
    @all_tags = Tag.find(:all, :order => 'name ASC')
    re = Regexp.new("^#{params[:q]}", "i")
    @tags = @all_tags.find_all do |t|
      t.name.match re
    end
    render :inline => @tags
  end

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
    respond_to do |format|
      if @book.fetch_attrs_from_amazon() && @book.save
        flash[:success] = 'Book was successfully added to list'
        format.html { redirect_to books_path }
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
    
  end

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

