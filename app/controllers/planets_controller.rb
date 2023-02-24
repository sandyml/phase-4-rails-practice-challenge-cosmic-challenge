class PlanetsController < ApplicationController

 # GET /planets
 def index
  render json: Planet.all, status: :ok
 end

 
end
