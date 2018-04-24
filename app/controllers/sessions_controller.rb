class SessionsController < ApplicationController

  def new
  end

  def create
    ah = auth_hash

    @user = User.find_or_create_by!(uid: ah.uid) do |user|
      user.name = ah.info.name
      user.email = ah.info.email
    end

    session[:user_id] = @user.id

    redirect_to dungeon_instances_path
  end

  def failure
    redirect_to new_sessions_path, alert: "Authentication failed, please try again."
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end