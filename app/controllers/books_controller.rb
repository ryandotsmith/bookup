class BooksController < ApplicationController
  before_filter :authenticate
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
  
protected
  
  def load_user
    @user = User.find(session[:user_id])
  end

end#class

