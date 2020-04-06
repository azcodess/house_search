require 'nokogiri'
require 'byebug'
require 'httparty'
require 'csv'
require 'colorize'
require 'tty-font'

def get_aspley_data
  url = "https://www.domain.com.au/rent/aspley-qld-4034/?price=0-400"

  unparsed_page = HTTParty.get(url)
  parsed_page    = Nokogiri::HTML(unparsed_page)
  house_listings_data = []
  house_listings = parsed_page.css('.listing-result__details')
  house_listings.each do |hl|
    prop_type      = hl.css('.listing-result__property-type')[0]
    price          = hl.css('.listing-result__price')[0]
    suburb_address = hl.css('span[itemprop=streetAddress]')[0]

    house_array = [house_listings]
    house_array.push("#{prop_type} #{price}")
    
    house_listings_data << [prop_type, price, suburb_address]
    puts [prop_type, price, suburb_address].to_csv(col_sep: "|")
  end
  File.open($aspley_file, "ab") do |f|
    data = house_listings_data.map{ |d| d.to_csv(col_sep: "|") }.join
    f.write(data)
  end
end

get_aspley_data

