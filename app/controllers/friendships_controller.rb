class FriendshipsController < ApplicationController
    def new 
        @friendship = Friendship.new
    end

    def create 
      @friendship = current_user.friendships.build(friend_id: params[:user_id])
      redirect_to users_path if @friendship.save
      redirect_to users_path, notice: 'Something Went Wrong Try Again Later'
    end

    def destroy
        @user = User.find(params[:id])
        @friendship = current_user.inverse_friendships.find { |friendship| friendship.user == @user }
        @friendship.destroy
        redirect_to users_path, notice: 'successfully removed'
    end
end
