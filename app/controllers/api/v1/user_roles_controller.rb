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
  

	def update
		@userRole = UserRole.find(params[:id])
		if @userRole.update(userRole_params)
			render json: @userRole
		else
			render json: {errors: @userRole.errors.full_messages}
		end
	end

	def destroy
		@userRole = UserRole.find(params[:id])
		@userRole.destroy
		render :nothing => true, :status => 204
	end

	private

  def userRole_params
    # whitelist params
    params.require(:user_role).permit(:id, :user_id, :role_id, :name, :years_exp)
	end
end
