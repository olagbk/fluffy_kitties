class User < ActiveRecord::Base
  has_many :orders
  has_many :login_tokens
  has_secure_password
end