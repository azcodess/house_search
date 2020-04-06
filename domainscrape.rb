require 'nokogiri'
require 'byebug'
require 'httparty'

require_relative 'domain_view'

class DomainScrape
$file = "houses.csv"
def domain_scraper

  greeting
  commands

  #URL with above inputs interpolated
  url   = "https://www.domain.com.au/rent/#{suburb_input}-qld-#{post_code_input}/?price=0-#{max_price_input}"

  #puts url
  unparsed_page = HTTParty.get(url)
  parsed_page    = Nokogiri::HTML(unparsed_page)

  house_listings = parsed_page.css('.listing-result__details')

  house_listings.each do |hl|
    prop_type      = hl.css('.listing-result__property-type')[0]
    price          = hl.css('.listing-result__price')[0]
    suburb_address = hl.css('span[itemprop=streetAddress]')[0]

    house_array = [house_listings]
    house_array.push("#{prop_type} #{price}")



    CSV.open($file, "ab", {:col_sep => "|"}) do |csv|
      csv << [prop_type, price, suburb_address]

    end
  end

  p "All data returned is now located in a file in your folder called houses.csv :)"

end

domain_scraper

end