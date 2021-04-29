class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friend_id: params[:user_id])
    return redirect_to users_path, notice: 'Successfully sent' if @friendship.save
    redirect_to users_path, notice: 'Something Went Wrong Please Try Again Later'
  end

  def destroy
    @user = User.find(params[:id])
    @friendship = current_user.inverse_friendships.find { |friendship| friendship.user == @user }
    @friendship.destroy
    redirect_to users_path, notice: 'successfully removed'
  end

  def user
    @friend = User.find(params[:user_id])
  end
end
