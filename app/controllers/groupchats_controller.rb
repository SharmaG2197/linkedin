class GroupchatsController < ApplicationController
  def index
    @groups = current_user.group_owners
  end

  def show
    @group = Group.find(params[:id])
    @sender = current_user
  end

  def new
  end

  def create
    # byebug
    @group = Group.find(params['group_id'])
    @group_member = @group.members
    @groupchat = Groupchat.new(sender_id: params[:sender_id], group_id: params[:group_id], text: params[:text])
    if @groupchat.save
      redirect_to @groupchat
    else
      render :new, status: :unprocessable_entity
    end
  end
end
