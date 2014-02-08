class User < ActiveRecord::Base
  attr_accessible :email, :fname, :lname, :password
  validates_presence_of :email
end
