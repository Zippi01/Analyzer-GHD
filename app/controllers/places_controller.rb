class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  @@m = 500

  def index
     @places = Place.all
   end

   def show
   end

   def new
     @place = Place.new
   end

   def edit
   end

   def create
     # @place = Place.create(place_params)
     # respond_to do |format|
     #   if @place.save
     #     format.html { redirect_to @place, notice: 'Place was successfully created.' }
     #     format.js {}
     #   else
     #     format.html { render :new }
     #     format.js {}
     #   end
     # end
     source = place_params
     puts (place_params["rating"])
     puts (place_params["comment_count"])
     rate = place_params["rating"].split("; ")
     rate = rate.map(&:to_f)
     comments_count = place_params["comment_count"].split("; ")
     comments_count = comments_count.map(&:to_f)
     @elem = 0
     rate.each do |elem|
       @elem += elem
     end
     @elem /= rate.size
     # puts (@elem)
     rate.each_with_index do |elem, i|
       @rating = (comments_count[i] / comments_count[i] + @@m) * elem + (@@m / comments_count[i] + @@m) * @elem
       puts(@rating)
     end
   end

   def update
   end

   def destroy
   end

   private

   # def set_place
   #   @place = Place.find(params[:id])
   # end

   def place_params
     params.require(:place).permit(:name, :address, :rating, :comment_count)
   end
end
