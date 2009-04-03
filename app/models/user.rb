class User < ActiveRecord::Base
  include Clearance::App::Models::User
  attr_accessible :name
  has_many :listings
  has_many :books, :through => :listings
  validates_presence_of :name
end