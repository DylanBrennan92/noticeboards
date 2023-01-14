class Board < ApplicationRecord
    include Visible

    has_many :posts, dependent: :destroy

    validates :title, presence: true, length: {minimum: 3}
    validates :description, presence: true, length: {minimum: 8}
    validates :status, presence: true
end
