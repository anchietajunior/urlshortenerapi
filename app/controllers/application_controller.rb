class ApplicationController < ActionController::API


  private
 
  def authenticate_request
    @result = Jwt::UserAuthenticationService.call(request.headers)
    render json: { errors: "Unathorized" }, status: :bad unless @result.success?
  end

end
