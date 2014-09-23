class FollowingRelationshipsController < ApplicationController
  def create
    user = find_user
    current_user.followed_users << user

    redirect_to user
  end

  def destroy
    user = find_user
    current_user.followed_users.delete(user)

    redirect_to user
  end

  private

  def find_user
    User.find(params[:user_id])
  end
end
