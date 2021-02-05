class RelationshipsController < ApplicationController

  def create
    relationship = Relationship.new
    relationship.following_id = current_user.id
    relationship.followed_id = params[:user_id]

    relationship.save

    redirect_to request.referer
  end

  def destroy
    relationship = Relationship.find_by(following_id: current_user.id, followed_id: params[:user_id])
    relationship.destroy
    redirect_to request.referer
  end

  def following
    user = User.find(params[:user_id])
    @following_users = user.following_users
  end

  def followed
    user = User.find(params[:user_id])
    @followed_users = user.followed_users
  end
  
end
