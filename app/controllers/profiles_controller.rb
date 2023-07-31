class ProfilesController < ApplicationController
  before_action :get_profile, only: [:index, :edit, :update]

  def index
    @posts = current_user.posts.order(:title).page params[:page]
    # ids = current_user.friend_requests.pluck(:friend_id)
    ids = current_user.friendships.pluck(:friend_id)
    @users = User.where.not(id: [ids])
    @incoming = FriendRequest.where(friend: current_user)
    @outgoing = current_user.friend_requests
    @friend_ship = current_user.friendships.all
  end

  def show
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id

    if @profile.save
      redirect_to profiles_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profiles_url
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def get_profile 
      @profile = current_user.profile
    end
    
    def profile_params
      params.require(:profile).permit(:username, :address, :dob, :about, :bio, :user_id, :image)
    end
end