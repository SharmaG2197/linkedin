class GroupsController < ApplicationController
    def index
        # byebug
        @groups = current_user.group_owners
        @sender = current_user
        @group_list = current_user.groups
    end
    def show
        # byebug
        @sender = current_user
        @group = Group.find(params[:id])
        @members = @group.users
        @groupchat = @group.groupchats
        @group_not_your = @group.members
        @group_admin = @group.user
    end

    def new 
        @group = Group.new
    end

    def edit
        @group = Group.find(params[:id])
    end

    def create
        # byebug
        @group = Group.new(group_params)
        @group.user_id = current_user.id 
        if @group.save
            redirect_to groups_path
        else
            render :new, status: :unprocessable_entity 
        end
    end
 
    def update
        @group = Group.find(params[:id])
        if @group.update(group_params)
            redirect_to groups_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @group = Group.find(params[:id])
        @group.destroy
    
        redirect_to groups_path, status: :see_other
    end

    private
    def group_params
        params.require(:group).permit(:group_name, :user_id)
    end
end