class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  @@m = 500

   def new
     @place = Place.new
   end


   def create
     if current_user
       @email = current_user.email
       PlacesJob.perform_later place_params, @email
       flash[:notice] = "We send result to #{@email}"
       redirect_to root_path
     else
       flash[:notice] = "You must be login"
       redirect_to root_path
     end
   end


   private

   def place_params
     params.require(:place).permit(:name, :address, :rating, :comment_count)
   end
end
