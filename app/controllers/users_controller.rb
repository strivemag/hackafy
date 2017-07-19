class UsersController < ApplicationController
  before_action :authenticate_user!

  def update
    # current_user = User.find(params[:id])
    if current_user.update_attributes(user_params)
      render json: current_user, serializer: CurrentUserSerializer, status: 200
    else
      render json: { errors: current_user.errors.full_messages }, status: 422
    end
  end

  private

    def user_params
      params.permit(:avatar, :username, :email, :password)
    end
end
