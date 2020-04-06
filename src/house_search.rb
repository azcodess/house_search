require 'nokogiri'
require 'byebug'
require 'httparty'

$file = "houses.csv"

def get_zillmere_data
  url = "https://www.domain.com.au/rent/zillmere-qld-4034/?price=0-900"
  
  unparsed_page = HTTParty.get(url)
  parsed_page    = Nokogiri::HTML(unparsed_page)

  house_listings = parsed_page.css('.listing-result__details')
  house_listings.each do |hl|
    prop_type      = hl.css('.listing-result__property-type')[0]
    price          = hl.css('.listing-result__price')[0]
    suburb_address = hl.css('span[itemprop=streetAddress]')[0]

    house_array = [house_listings]
    house_array.push("#{prop_type} #{price}")

    p prop_type + price

    CSV.open($file, "ab", {:col_sep => "|"}) do |csv|
      csv << [prop_type, price, suburb_address]
        end
    end
end
