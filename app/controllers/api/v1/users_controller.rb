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

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			render json: @user
		else
			render json: {errors: @user.errors.full_messages}
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		render :nothing => true, :status => 204
	end

	private

  def user_params
    # whitelist params
    params.require(:user).permit(:name, :id, :email_address)
	end
end
