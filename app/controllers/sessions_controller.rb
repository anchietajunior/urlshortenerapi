class SessionsController < ApplicationController

  def authenticate
    result = Jwt::TokenGeneratorService.call(session_params[:email], session_params[:password])
    if result.success?
      render json: { jwt: result.value }, status: :ok
    else
      render json: { errors: result.error }, status: :bad
    end
  end

  private

  def session_params
    params.permit(
      :email,
      :password
    )
  end
end

