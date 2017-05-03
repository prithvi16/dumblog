class Post < ApplicationRecord
	validates :user_id, presence: true
	belongs_to :user
	acts_as_taggable
	has_many :comments
end
