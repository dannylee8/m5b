class Api::V1::TeamsController < ApplicationController
  # GET /users
  def index
    @teams = Team.all
    render json: @teams
  end

	def create
		team = Team.create!(team_params)
		if team.valid?
				render json: :team
		else
				render json: {errors: team.errors.full_messages}
		end
	end
	
  def show
    @team = Team.find(params[:id])
    render json: @team
	end

	def update
		@team = Team.find(params[:id])
		if @team.update(team_params)
			render json: @team
		else
			render json: {errors: @team.errors.full_messages}
		end
	end

	def destroy
		@team = Team.find(params[:id])
		@team.destroy
		render :nothing => true, :status => 204
	end

	private

  def team_params
    # whitelist params
    params.permit(:name, :website, :admin)
	end
end
