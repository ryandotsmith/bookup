class ListingsController < ApplicationController
  before_filter :authenticate, :except => [:index,:show]
  before_filter :load_user
  before_filter :load_book
  
  def index
    @listings = Listing.find(:all)
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
    redirect_to @book if @listing.save
  end#create

protected 
  ####################
  #load_user
  def load_user
    @user = current_user
  end#load_user
  ####################
  #load_book
  def load_book
    @book = Book.find( params[:book_id] )
  end#load_book
end
