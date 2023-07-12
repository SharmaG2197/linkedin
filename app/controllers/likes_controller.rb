class LikesController < ApplicationController
    def create
        if post.likes.create(user: current_user)
            redirect_to post_path(@post)
        else
            redirect_to post_redirect(post), :alert => 'An error prevented you from liking this post!'
        end
    end

    def destroy
        post.likes.where(user: current_user).destroy_all
        redirect_to post_path(@post)
    end

    private
    def post
        @post ||= Post.find(params[:post_id])
    end
end
