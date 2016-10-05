class Contact < ActiveRecord::Base
  
  validates :text, presence: true,
                    length: { minimum: 1 }
  
end
