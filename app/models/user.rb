class User < ActiveRecord::Base
  include Clearance::App::Models::User
  attr_accessible :name
  has_many :books
end