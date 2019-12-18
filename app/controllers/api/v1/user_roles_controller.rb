class Api::V1::UserRolesController < ApplicationController
  def index
    @userRoles = UserRole.all
    render json: @userRoles
  end
	
  def show
    @userRole = UserRole.find(params[:id])
    render json: @userRole
	end

  def create
		userRole = UserRole.create!(userRole_params)
		if userRole.valid?
				render json: userRole
		else
				render json: {errors: userRole.errors.full_messages}
		end
  end
  
	private

  def userRole_params
    # whitelist params
    params.permit(:user_id, :role_id, :name, :years_exp)
	end
end
