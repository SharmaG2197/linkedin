class HomesController < ApplicationController
  def index
    @posts = Post.order(:title).page params[:page]
  end
end
