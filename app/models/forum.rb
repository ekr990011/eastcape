class Forum < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  default_scope -> { order(created_at: :desc) }
  
  validates :title, presence: true,
                    length: { minimum: 1, maximum: 50 }
  validates :post,  presence: true,
                    length: { minimum: 1 }
        
end
