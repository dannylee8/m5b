class Api::V1::RolesController < ApplicationController
	def index
    @roles = Role.all
    render json: @roles
  end
	
  def show
    @role = Role.find(params[:id])
    render json: @role
	end

	private

  def user_params
    # whitelist params
    params.permit(:name, :id)
	end
end
