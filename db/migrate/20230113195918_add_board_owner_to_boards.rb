class AddBoardOwnerToBoards < ActiveRecord::Migration[7.0]
  def change
    add_column :boards, :board_owner, :string
  end
end
