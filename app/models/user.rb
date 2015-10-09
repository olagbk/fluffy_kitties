class User < ActiveRecord::Base
  has_many :orders
  has_many :login_tokens
  has_many :addresses
  has_secure_password
end