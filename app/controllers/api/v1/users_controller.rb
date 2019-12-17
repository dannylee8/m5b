class Api::V1::UsersController < ApplicationController
  # GET /users
  def index
    @users = User.all
    render json: @users
  end

	def create
		user = User.create!(user_params)
		if user.valid?
				render json: user
		else
				render json: {errors: user.errors.full_messages}
		end
	end
	
  def show
    @user = User.find(params[:id])
    render json: @user
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		render :nothing => true, :status => 204
	end

	private

  def user_params
    # whitelist params
    params.permit(:name, :email_address)
	end
end
