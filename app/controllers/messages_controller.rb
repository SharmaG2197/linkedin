class MessagesController < ApplicationController
    def index
        @users = User.where.not(id: [current_user])
    end
    def show 
        # byebug
        # @sender = User.find(params[:users][:ids])
        @sender = current_user
        @receiver = User.find(params[:receiver_id])
        @messages = Message.where(sender_id: @sender.id, receiver_id: @receiver.id).or(Message.where(sender_id: @receiver.id, receiver_id: @sender.id))
        @chat_id = [@sender.id, @receiver.id].sort.join("") #generates a unique identifier for a pair of user 
    end
    def create 
        message = Message.create(sender_id: params[:sender_id], receiver_id: params[:receiver_id], text: params[:message])
        redirect_back(fallback_location: "/users")
    end 
end
