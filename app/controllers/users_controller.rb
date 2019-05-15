class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      render json: { message: 'User subscribed!' }, status: :ok
    else
      render json: { message: @user.errors.messages.first }, status: :bad
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
