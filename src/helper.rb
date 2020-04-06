require 'nokogiri'
require 'byebug'
require 'httparty'

$file = "houses.csv"
def domain_scraper

  #user prompt to get information for URL
  puts ' Hey there welcome to house_search! Enter the suburb you wish to search...'
  suburb_input = gets.chomp
  puts "What is the postcode?"
  post_code_input = gets.chomp
  puts "What is the most you are willing to pay?"
  max_price_input = gets.chomp

  #URL with above inputs interpolated
  url   = "https://www.domain.com.au/rent/#{suburb_input}-qld-#{post_code_input}/?price=0-#{max_price_input}"

  #puts url
  unparsed_page = HTTParty.get(url)
  parsed_page    = Nokogiri::HTML(unparsed_page)

  house_listings = parsed_page.css('.listing-result__details')

  house_listings.each do |hl|
    prop_type      = hl.css('.listing-result__property-type')[0] #.text
    price          = hl.css('.listing-result__price')[0] #.textsubr
    suburb_address = hl.css('span[itemprop=streetAddress]')[0] #.text
    # address_locality = hl.css('span[itemprop=addressLocality]')[0] #.text
    # address_region = hl.css('span[itemprop=addressRegion]')[0] #.text
    # postal_code = hl.css('span[itemprop=postalCode]')[0] #.text
    #.css-1fclaxo
    # house_array.push("#{prop_type} #{price} #{suburb_address}  #{suburb_address} #{address_locality} #{address_region} #{postal_code}")

    house_array = [house_listings]
    house_array.push("#{prop_type} #{price}")

    CSV.open($file, "ab", {:col_sep => "|"}) do |csv|
      csv << [prop_type, price, suburb_address]

    end
  end

  p "All data returned is now located in a file in your folder called houses.csv :)"
  # for i in house_array
  #   puts i
  #     end
  #
  # house_array.each do |i|
  #   puts "{#{i}}"
  # end
end

domain_scraper