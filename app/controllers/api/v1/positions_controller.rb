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

	private

  def position_params
    # whitelist params
    params.permit(:user_id, :team_id, :name, :role)
	end
end
