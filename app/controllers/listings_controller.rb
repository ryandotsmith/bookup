class ListingsController < ApplicationController
  before_filter :authenticate, :except => [:index,:show]
  before_filter :load_user
  before_filter :load_book
  
  def index
    if params[:book_id]
      @listings = @book.listings
      @listings_type = :book
    elsif params[:user_id]
      @listings = @user.listings
      @listings_type = :user
    else
      @listings = Listing.find(:all) unless @book
      @listings_type = :all
    end
  end#index

  def show
    @listing = Listing.find( params[:listing] )
  end#show

  def new
    @listing = @user.listings.build
  end#new

  def create
    @listing = @user.listings.build( params[:listing] )
    @listing.book = @book
    if @listing.save
      redirect_to @book
    else
      render :action => 'new'
    end
  end#create
  
  def edit
    @listing = Listing.find( params[:id] )
  end#edit
  def update
    @listing = Listing.find( params[:id] )
    flash[:notice] = "listing was successfully updated"
    redirect_to user_listings_url(@user) if @listing.update_attributes(params[:listing])
  end#update
protected 
  ####################
  #load_user
  def load_user
    @user = current_user
  end#load_user
  ####################
  #load_book
  def load_book
    @book = Book.find( params[:book_id] ) if params[:book_id]
  end#load_book
end
