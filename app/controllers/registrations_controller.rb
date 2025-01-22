class RegistrationsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  def new
  end

  def create
    user = User.new(params.permit(:email_address, :password))
    if user.save
      start_new_session_for user
      redirect_to after_authentication_url
    else
      redirect_to signup_path, alert: @user.errors.full_messages
    end
  end
end
