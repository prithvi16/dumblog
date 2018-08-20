class Post < ApplicationRecord

	validates :user_id,:title , :body , presence: true
	validates :title, length: { in: 6..200 }
	validates :body , length: { minimum:10}
	belongs_to :user
	acts_as_taggable
	acts_as_taggable_on :tags
	acts_as_votable
	has_many :comments

	 extend FriendlyId
    friendly_id :title, use: 	[:slugged , :history]
end
