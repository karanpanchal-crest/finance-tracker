class FriendshipsController < ApplicationController

  def destroy
    @user  = current_user.friendships.where(friend_id: params[:id]).first
    @user.destroy
    respond_to do |format|
      format.html {redirect_to my_friends_path, notice: "Friend was removed successfully"}
    end
  end

end
