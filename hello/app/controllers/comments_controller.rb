class CommentsController < ApplicationController
  before_action :load_comment, only: [:destroy,:edit,:update]

  # def index
  #   @post = Post.find_by(id: params[:id])
  #   @comments = Comment.find_by(post_id: params[:id])
  # end

  def create
    @comment = Comment.create comment_params
    @comments = @comment.post.comments.order(created_at: :desc)
  end

  def destroy
    @comment.destroy

  end

  def edit
  end

  def update
    @comment.update(comment_params)
  end

  def show
  end
private

  def comment_params
    params.require(:comment).permit(:content,:user_id,:post_id)
  end

  def load_comment
    @comment = Comment.find_by(id: params[:id])
  end

end
