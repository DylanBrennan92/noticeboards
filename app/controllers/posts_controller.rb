class PostsController < ApplicationController

    def create
        @board = Board.find(params[:board_id])
        @post = @board.posts.create(post_params)
        redirect_to board_path(@board)
    end


    def destroy
        @board = Board.find(params[:board_id])
        @post = @board.posts.find(params[:id])
        @post.destroy

        redirect_to board_path(@board), status: :see_other
    end

    private 
    def post_params
        params.require(:post).permit(:title, :body, :posted_by, :category, :status)
    end


end
