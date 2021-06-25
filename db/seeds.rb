# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

url = 'http://tmdb.lewagon.com/movie/top_rated'

data = URI.open(url).read

json_data = JSON.parse(data)

json_data["results"].each do |movie|
  Movie.create(
    title: movie["title"],
    overview: movie["overview"],
    rating: movie["vote_average"],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}"
    )
    puts "La película nro. #{index + 1} ha sido creada"
  end
