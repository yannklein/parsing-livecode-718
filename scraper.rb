require 'open-uri'
require 'nokogiri'

def fetch_movies_url
  top_chart_url = "https://www.imdb.com/chart/top"
  html_content = URI.open(top_chart_url, 'Accept-Language' => 'en').read
  doc = Nokogiri::HTML(html_content)
  doc.search('.titleColumn')
  href_array = []
  doc.search('.titleColumn').each_with_index do |element, index|
    break if index == 5
    href_array << "https://www.imdb.com#{element.search("a").attribute("href").value}"
  end
  href_array
end

def scrape_movie(url)
  html_content = URI.open(url, 'Accept-Language' => 'en-US').read
  doc = Nokogiri::HTML(html_content)
  title = doc.search('.TitleHeader__TitleText-sc-1wu6n3d-0').text.strip
  year = doc.search('.TitleBlockMetaData__ListItemText-sc-12ein40-2.jedhex').first.text.strip.to_i
  director = doc.search('.ipc-metadata-list-item__list-content-item.ipc-metadata-list-item__list-content-item--link').first.text.strip
  storyline = doc.search('.ipc-html-content.ipc-html-content--base').first.text.strip
  cast = doc.search('.StyledComponents__ActorName-y9ygcu-1.eyqFnv').map { |tag| tag.text.strip}.first(3)
  {
    cast: cast,
    director: director,
    storyline: storyline,
    title: title,
    year: year
  }
end