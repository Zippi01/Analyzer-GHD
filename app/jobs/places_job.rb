class PlacesJob < ApplicationJob
  queue_as :default

  def perform(place_params)
    @@m = 500
    puts (place_params["rating"])
    puts (place_params["comment_count"])
    rate = place_params["rating"].split("; ")
    rate = rate.map(&:to_f)
    comments_count = place_params["comment_count"].split("; ")
    comments_count = comments_count.map(&:to_f)
    @avarage_score = 0
    rate.each do |elem|
      @avarage_score += elem
    end
    @avarage_score /= rate.size
    # puts (@elem)
    my_hash = []
    rate.each_with_index do |elem, i|
      @rating = (comments_count[i] / comments_count[i] + @@m) * elem + (@@m / comments_count[i] + @@m) * @avarage_score
      # json = JSON.parse({"rating": #{@rating}}")
      my_hash << {:rating => "#{@rating}", :comment_count => "#{comments_count[i]}", :rate => "#{elem}"}
    end
    places_json = my_hash.to_json
    places_json = JSON[places_json].sort_by{ |e| e['rating'].to_i }
    places_json = places_json.reverse
    puts(places_json)
    PlaceMailer.welcome_email(places_json).deliver_later
  end
end
