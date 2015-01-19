json.array!(@movies) do |movie|
  json.extract! movie, :id, :title, :format, :length, :release_year, :rating
  json.url movie_url(movie, format: :json)
end
