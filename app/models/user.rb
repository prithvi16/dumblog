class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and
	 acts_as_tagger
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :trackable, :validatable
	devise :omniauthable, :omniauth_providers => [:github]


	validates :user_name, presence: true, length: { minimum: 4,
	maximum: 16 } , uniqueness: { case_sensitive: false }

	validates :subdomain, presence: true, length: { minimum: 4,
maximum: 16 } , uniqueness: { case_sensitive: false }
	validates :blog_name, length: {minimum: 4 , maximum: 20}
	has_many :posts , dependent: :destroy

	has_many :comments , dependent: :destroy
	has_many :notifications , dependent: :destroy
	include Gravtastic
    gravtastic :size => 128

  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following

 acts_as_voter


	def follow(user_id)
    following_relationships.create(following_id: user_id)
  end

  def unfollow(user_id)
    following_relationships.find_by(following_id: user_id).destroy
  end









end