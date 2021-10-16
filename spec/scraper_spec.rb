# data for #fetch_movies_url:
# [
#   "https://www.imdb.com/title/tt0111161/",
#   "https://www.imdb.com/title/tt0068646/",
#   "https://www.imdb.com/title/tt0071562/",
#   "https://www.imdb.com/title/tt0468569/",
#   "https://www.imdb.com/title/tt0050083/"
# ]

require_relative "../scraper.rb"

describe "#fetch_movies_url" do
  it "returns an array of movie urls" do
    actual = fetch_movies_url
    expected = [
      "https://www.imdb.com/title/tt0111161/",
      "https://www.imdb.com/title/tt0068646/",
      "https://www.imdb.com/title/tt0071562/",
      "https://www.imdb.com/title/tt0468569/",
      "https://www.imdb.com/title/tt0050083/"
    ]
    expect(actual).to eq(expected)
  end
end

# data for #scrape_movie:
# https://www.imdb.com/title/tt0468569/

# {
#   cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
#   director: "Christopher Nolan",
#   storyline: "When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham. The Dark Knight must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
#   title: "The Dark Knight",
#   year: 2008
# }

describe "#scrape_movie" do
  it "return a Hash with movie info" do
    url = "https://www.imdb.com/title/tt0468569/"
    actual = scrape_movie(url)
    expected = {
      cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
      director: "Christopher Nolan",
      storyline: "Set within a year after the events of Batman Begins (2005), Batman, Lieutenant James Gordon, and new District Attorney Harvey Dent successfully begin to round up the criminals that plague Gotham City, until a mysterious and sadistic criminal mastermind known only as \"The Joker\" appears in Gotham, creating a new wave of chaos. Batman's struggle against The Joker becomes deeply personal, forcing him to \"confront everything he believes\" and improve his technology to stop him. A love triangle develops between Bruce Wayne, Dent, and Rachel Dawes. —Leon Lombardi",
      title: "The Dark Knight",
      year: 2008
    }
    expect(actual).to eq(expected)
  end
end