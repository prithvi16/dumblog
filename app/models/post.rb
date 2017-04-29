class Post < ApplicationRecord
validates :user_id, presence: true
belongs_to :user
is_impressionable
has_many :comments
end
