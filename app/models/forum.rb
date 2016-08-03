class Forum < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  
  validates :title, presence: true,
                    length: { minimum: 1, maximum: 50 }
  validates :post,  presence: true,
                    length: { minimum: 1 }
        
end
