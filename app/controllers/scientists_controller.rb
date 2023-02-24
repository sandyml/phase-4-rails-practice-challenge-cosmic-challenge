class ScientistsController < ApplicationController

 # GET /scientists
 def index
  render json: Scientist.all, status: :ok 
 end

 # GET /scientists/:id p
 def show
  scientist_found = Scientist.find_by(id: params[:id])
  if scientist_found
   render json: scientist_found, serializer: ScientistShowSerializer, status: :ok
  else
   render json: { "error": "Scientist not found" }, status: :not_found
  end  
 end

 def create
  new_scientist = Scientist.create(new_scientist_params)  
  if new_scientist
   if new_scientist.valid?
    render json: new_scientist, status: :created 
   else
    render json: { "errors": new_scientist.errors.full_messages }, status: :unprocessable_entity
   end
  else
   render json: { "error": "Scientist not found" }, status: :not_found
  end
 end

 # PATCH edit 
 def update
  scientist_to_patch = Scientist.find_by(id: params[:id])
  if scientist_to_patch ## IF we find the Scientist ==> Continue the PATCH/update/edit
      scientist_to_patch.update(edit_scientist_params) # errors array attached if it does not .valid is checking for that something that is valid should not have an error 
      if scientist_to_patch.valid?
       render json: scientist_to_patch
      else
       render json: { "errors": scientist_to_patch.errors.full_messages }, status: :unprocessable_entity
      end
  else
      render json: { "error": "Scientist not found" }, status: :not_found
  end
end

 # DELETE scientists/:id
 def destroy
  destroy_scientist = Scientist.find_by(id: params[:id]) #id hash is coming from the url 
  if destroy_scientist
   destroy_scientist.destroy
   head :no_content
  else
   render json: { "error": "Scientist not found" }, status: :not_found
  end
 end


 private

 def new_scientist_params
  params.permit(:name, :field_of_study, :avatar)  
 end

 # i know they are the same but more for me to remember
 def edit_scientist_params
  params.permit(:name, :field_of_study, :avatar)  
 end

end
