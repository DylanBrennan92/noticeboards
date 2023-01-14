class Post < ApplicationRecord
  include Visible

  belongs_to :board
end
