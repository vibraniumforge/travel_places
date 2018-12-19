class User < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  binding.pry
  has_one :username
  has_one :email
  has_one :password
  has_many :tweets
end
