class User < ActiveRecord::Base
  validates_uniqueness_of :username
  has_secure_password
  
  
  has_many :forums
  has_many :comments
  
  def admin?
    self.role == 'admin'
  end
  
end
