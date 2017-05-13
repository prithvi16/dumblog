class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :trackable, :validatable

	validates :user_name, presence: true, length: { minimum: 4,
	maximum: 16 } , uniqueness: true
	validates :blog_name, length: {minimum: 4 , maximum: 20}
	has_many :posts , dependent: :destroy

	has_many :comments , dependent: :destroy
	has_many :notifications , dependent: :destroy
	include Gravtastic
    gravtastic :size => 128

	
end
