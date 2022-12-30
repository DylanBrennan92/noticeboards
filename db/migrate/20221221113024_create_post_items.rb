class CreatePostItems < ActiveRecord::Migration[7.0]
  def change
    create_table :post_items do |t|
      t.string :board
      t.belongs_to :board, null: false, foreign_key: true
      t.belongs_to :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
