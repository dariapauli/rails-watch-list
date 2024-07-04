# 1- require open-uri and json
require "open-uri"
require "json"

# 2-creating a variable with the url
url = "https://tmdb.lewagon.com/movie/top_rated"

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Creating movies"

# 3 - Read API
movie_serialized = URI.open(url).read
movies = JSON.parse(movie_serialized)

# 4- iterate on each movie and create a movie in the db
movies["results"].each do |movie|
  new_movie = Movie.new
  new_movie.title = movie["title"]
  new_movie.overview = movie["overview"]
  new_movie.rating = movie["vote_average"]
  new_movie.poster_url = "https://image.tmdb.org/t/p/original/#{movie["poster_path"]}"
  new_movie.save!
end

puts "Finished!"
