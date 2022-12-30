class Board < ApplicationRecord
    has_many :memberships
    has_many :post_items
    has_many :users, through: :memberships
    has_many :posts, through: :post_items
end
