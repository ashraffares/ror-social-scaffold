class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
    @pending_friends = current_user.pending_friends
    @friends_requests = current_user.friend_requests
    @friends = current_user.friends
  end
end
