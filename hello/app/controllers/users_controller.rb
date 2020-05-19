class UsersController < ApplicationController

  def show

    if params[:id] 
      @posts = Post.where(user_id: params[:id]).order(created_at: :desc).page params[:page]
      @user = User.find_by(id: params[:id])
    end

  end

end
