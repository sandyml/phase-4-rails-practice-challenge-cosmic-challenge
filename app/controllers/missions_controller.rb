class MissionsController < ApplicationController

 def index
 render json: Mission.all, status: :ok 
 end

 # POST /missions
 def create
  new_mission = Mission.create(mission_params)
  if new_mission.valid?
   render json: new_mission.planet, status: :created
  else
   render json: { "errors": new_mission.errors.full_messages }, status: :unprocessable_entity
  end
 end

 private

 def mission_params
  params.permit(:name, :scientist_id, :planet_id )
 end

end
