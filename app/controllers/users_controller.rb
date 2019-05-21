class UsersController < ApplicationController
  def create
    result = Users::UserCreatorService.call(user_params)
    p result
    if result.success?
      render json: { message: "#{result.value} subscribed!" }, status: :ok
    else
      render json: { error: result.error }, status: :bad
    end
  end

  private

  def user_params
    params.permit(:user, :email, :password, :password_confirmation)
  end
end
