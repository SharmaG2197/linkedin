class MembersController < ApplicationController

  def index
    @users = User.where.not(id: [current_user])
    @group_id = params[:id]
  end

  # def show
  #   @member = Member.find(params[:id])
  # end

  def new
    create
  end

  def create
    @member = Member.new(user_id: params['id'], group_id: params['group_id'])

    if @member.save
      redirect_to groups_path
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update()
      redirect_to members_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to groups_path, status: :see_other
  end
end
