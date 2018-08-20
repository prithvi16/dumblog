class Comment < ApplicationRecord
	belongs_to :post
	belongs_to :user
	has_many :notifications
	has_ancestry
	validates :user_id,:post_id , :content , presence: true
	validates :content, length: { in: 5..1000 }
	
end
