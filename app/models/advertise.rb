class Advertise < ActiveRecord::Base
  
  validates_confirmation_of :email, :message => "should match confirmation"
  validates :text, presence: true,
                    length: { minimum: 1 }
                    
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  
end
