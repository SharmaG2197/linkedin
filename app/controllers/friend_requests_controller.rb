class FriendRequestsController < ApplicationController
    before_action :set_friend, only: :destroy

    def index
        @friends = current_user.friends
    end

    def create
        @friend = User.find(params[:id])
        @friend_request = current_user.friend_requests.new(friend: @friend)  
        if @friend_request.save
            redirect_to profiles_path
        else
            render json: @friend_request.errors, status: :unprocessable_entity
        end
    end

    def show
    end

    def edit
        @friend_request = FriendRequest.find(params[:id])
        @friend_request.accept
        redirect_to profiles_path
        head :no_content
    end

    def update
    end

    def update_user
        @friend_request = FriendRequest.find(params[:id])
        @friend_request.accept
        redirect_to profiles_path
    end

    private
    def set_friend
        @friend = current_user.friends.find(params[:id])
    end
end