require "yaml"
require_relative "scraper.rb"
# 1. Scrape the imdb top rated webpage to get
# movie detail URLS
urls = fetch_movies_url

# 2. For each found URL, scrape the movie detail
# page
movies = []
urls.each do |url|
  # 3. Get the movie data and store into a variable
  movie = scrape_movie(url)
  movies << movie
end  

# 4. store into movies.yml
serialized_movie = movies.to_yaml

File.open("the_file.yml", "w") do |f|
  f.write(serialized_movie)
end