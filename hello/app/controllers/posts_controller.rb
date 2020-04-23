class PostsController < ApplicationController
  before_action :load_post ,only: [:edit,:update,:show,:destroy]
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create post_params
    redirect_to posts_path
  end

  def show
    @post = Post.find_by(id: params[:id])
    @post.hit +=1
    @post.save
  end

  def toggle_like
    @like = current_user.likes.find_by(post_id: params[:id])
    @post = Post.find(params[:id])

    if @like
      @like.destroy
    else
      @like = Like.create(post_id: params[:id],user_id: current_user.id)
    end
    
    
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

    def load_post
      @post = Post.find_by(id: params[:id])
    end

    def post_params
      params.require(:post).permit(:title,:content,:hit,:user_id)
    end

end
