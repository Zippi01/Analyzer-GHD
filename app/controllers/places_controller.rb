class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  @@m = 500

   def index
     @places = Place.all
   end


   def new
     @place = Place.new
   end


   def create
     PlacesJob.perform_later place_params
   end


   private

   def place_params
     params.require(:place).permit(:name, :address, :rating, :comment_count)
   end
end
