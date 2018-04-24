class SessionsController < ApplicationController

  def new
    p :foo
  end

  def create
    ah = auth_hash

    @user = User.find_or_create_by!(uid: ah.uid) do |user|
      user.name = ah.info.name
      user.email = ah.info.email
    end

    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end