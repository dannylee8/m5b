class Api::V1::PositionsController < ApplicationController
  # GET /users
  def index
    @positions = Position.all
    render json: @positions
  end

	def create
		position = Position.create!(position_params)
		if position.valid?
				render json: :position
		else
				render json: {errors: position.errors.full_messages}
		end
	end
	
  def show
    @position = Position.find(params[:id])
    render json: @position
	end

	def update
		@position = Position.find(params[:id])
		if @position.update(position_params)
			render json: @position
		else
			render json: {errors: @position.errors.full_messages}
		end
	end

	def destroy
		@position = Position.find(params[:id])
		@position.destroy
		render :nothing => true, :status => 204
	end


	private

  def position_params
    # whitelist params
    params.permit(:team_id, :name, :user_id, :role_id)
	end
end
