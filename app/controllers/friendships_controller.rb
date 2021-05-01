class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friend_id: params[:user_id], confirmed: false)
    if @friendship.save
      redirect_to users_path, notice: 'Successfully sent request'
    else
      redirect_to users_path, notice: 'Something Went Wrong Please Try Again Later'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @friendship = current_user.inverse_friendships.find { |friendship| friendship.user == @user }
    @friendship.destroy
    redirect_to users_path, notice: 'successfully removed'
  end

  def accept
    @user = User.find(params[:user_id])
    @friendship = current_user.inverse_friendships.find { |friendship| friendship.user == @user }
    @friendship.confirmed = true
    @friendship.save
    Friendship.create!(friend_id: @user.id, user_id: current_user.id, confirmed: true)
    redirect_to users_path(params[:user_id]), notice: 'successfully accepted it'
  end
end
