class UserFollowsController < ApplicationController
    include SessionsHelper
    before_action :logged_in_user?, only: [:show, :index, :edit, :update]
    # POST user_follows/
    def create
        user = User.find_by(id: params[:followed_id])
        current_user.follow(user)
        redirect_to user_path(user)
    end
    # DELETE user_follows/1/
    def destroy
        user = UserFollow.find_by(id: params[:id]).followed
        current_user.unfollow(user)
        redirect_to user_path(user)
    end
end
