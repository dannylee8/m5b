class Api::V1::UserRolesController < ApplicationController
  def index
    @userRoles = UserRole.all
    render json: @userRoles
  end
	
  def show
    @userRole = UserRole.find(params[:id])
    render json: @userRole
	end

	private

  def user_params
    # whitelist params
    params.permit(:name, :years_exp)
	end
end
