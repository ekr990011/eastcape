class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :forum
  
  default_scope -> { order(created_at: :desc) }
  
  #validates :commenter, presence = true,
   #                     length: { minimum: 1, maximum: 50 }
  #validates :comment, presence = true,
   #                   length: { minimum: 1 }
end
