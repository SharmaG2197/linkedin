class FriendsController < ApplicationController
    def index
        @friend_ship = Friendship.all
    end

    def destroy
        @friend_ship = Friendship.find(params[:id])
        @friend_ship.destroy
        redirect_to profiles_path, status: :see_other
    end
end