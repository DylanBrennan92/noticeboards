class AddPostOwnerToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :post_owner, :string
  end
end
