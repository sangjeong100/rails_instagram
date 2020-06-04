class UsersController < ApplicationController
  before_action :load_user ,only: [:show,:toggle_follow]

  def index
  
    # @q = User.ransack(email: params[:q])
    # puts @q
    # @users = @q.result(distinct: true)
    
    @users = User.select("*").from("users").where("email LIKE :query", query: "#{params[:q] <<"%"}")
    if !(@users.exists?) 
      @users = User.select("*").from("users").where("user_name LIKE :query", query: "#{params[:q] <<"%"}")
    end
    #user의 email 또는 name으로 검색

  end

  def show

    @following = current_user.followings.find_by(follower_id: @user.id)
    if params[:id] 
      @posts = Post.where(user_id: params[:id]).order(created_at: :desc).page params[:page]
    end
  end

  
  def toggle_follow
    
    @following = current_user.followings.find_by(follower_id: @user.id)
    
    if @following
      @following.destroy
    else
      @following = FollowRelationship.create(follower_id: @user.id, following_id: current_user.id)
    end
    render "toggle_follow.js"
    
  end

  private
  def load_user
    @user = User.find_by(id: params[:id])
  end

end
