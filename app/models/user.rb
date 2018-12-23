class User < ActiveRecord::Base
  has_many :places
  has_secure_password
end
