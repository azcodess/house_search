require 'nokogiri'
require 'byebug'
require 'httparty'

require_relative './search'

$file = "houses.csv"

def input
    gets.chomp
end

def suburb_input
#user prompt to get information for URL
  puts ' Hey there welcome to house_search! Please which suburb you would like to search...'
  puts '1. Aspley'
  puts '2. Zillmere'
  puts '3. Carseldine'
  puts '4. Logan'
    while suburb_input = input
        case suburb_input
        when "1"
            puts "you've chosen Aspley :)"
            break
        when "2"
            puts "you've chosen Zillmere :)"
            break
        when "3"
            puts "you've chosen Carseldine :)"
            break
        when "4"
            puts "you've chosen Logan :)"
            break
        else 
            puts " please select 1 of the 4 options"
            puts '1. Aspley'
            puts '2. Zillmere'
            puts '3. Carseldine'
            puts '4. Logan'
        end
    end
end

# def max_price
#     puts "what is the "
# end

# def aspley
#     aspley = "aspley"
#     postcode = "4034"
# end

suburb_input
# Try using the until method like this:

# prompt = "> " 
# print prompt

# user_input = nil
# until (user_input == 1 or user_input == 2)
#     puts "Please enter a 1 or 2." 
#     user_input = gets.chomp.to_i
# end



# if user_input == 1    
#    puts "One response." 
# RUN METHOD?
# elsif user_input == 2   
#    puts "Second response." 
# else    
#    puts "Please enter a 1 or a 2." 
# end
# def domain_scraper

#   suburb
#   puts "What is the postcode?"
#   post_code_input = gets.chomp
#   puts "What is the most you are willing to pay?"
#   max_price_input = gets.chomp

#   #URL with above inputs interpolated
#   url   = "https://www.domain.com.au/rent/#{suburb_input}-qld-#{post_code_input}/?price=0-#{max_price_input}"

#   #puts url
#   unparsed_page = HTTParty.get(url)
#   parsed_page    = Nokogiri::HTML(unparsed_page)

#   house_listings = parsed_page.css('.listing-result__details')

#   house_listings.each do |hl|
#     prop_type      = hl.css('.listing-result__property-type')[0] #.text
#     price          = hl.css('.listing-result__price')[0] #.textsubr
#     suburb_address = hl.css('span[itemprop=streetAddress]')[0] #.text
#     address_locality = hl.css('span[itemprop=addressLocality]')[0] #.text
#     # address_region = hl.css('span[itemprop=addressRegion]')[0] #.text
#     # postal_code = hl.css('span[itemprop=postalCode]')[0] #.text
#     #.css-1fclaxo
#     # house_array.push("#{prop_type} #{price} #{suburb_address}  #{suburb_address} #{address_locality} #{address_region} #{postal_code}")

#     house_array = [house_listings]
#     house_array.push("#{prop_type} #{price} #{address_locality}")

#     CSV.open($file, "ab", {:col_sep => "|"}) do |csv|
#       csv << [prop_type, price, suburb_address, address_locality]

#     end
#   end

#   p "All data returned is now located in a file in your folder called houses.csv :)"
#   # for i in house_array
#   #   puts i
#   #     end
#   #
#   # house_array.each do |i|
#   #   puts "{#{i}}"
#   # end
# end

# domain_scraper