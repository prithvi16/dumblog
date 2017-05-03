class Comment < ApplicationRecord
 belongs_to :post
 belongs_to :user
 has_many :notifications
 has_ancestry
end
