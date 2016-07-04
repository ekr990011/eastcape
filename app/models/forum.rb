class Forum < ActiveRecord::Base
  validates :title, presence: true,
                    length: { minimum: 1, maximum: 50 }
  validates :post,  presence: true,
                    length: { minimum: 1 }
        
end
