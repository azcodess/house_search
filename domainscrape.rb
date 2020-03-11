require 'nokogiri'
require 'open-uri'
require 'byebug'
require 'httparty'
# #
#  puts "hi please enter a suburb"
# suburb_input = gets.chomp
# puts "now a post code"
# post_code_input = gets.chomp
# puts "what is your "
# max_price_input = gets.chomp
# house = [suburb_input, post_code_input, max_price_input]

def scraper
  url2   = 'https://www.domain.com.au/rent/zillmere-qld-4034/?price=0-600'
  #url2 = "https://www.domain.com.au/rent/#{house[0]}-qld-#{house[1]}/?price=0-#{house[2]}"

  puts url2
  unparsed_page = HTTParty.get(url2)
  parsed_page    = Nokogiri::HTML(unparsed_page)
  # prop_type      = parsed_page.css('.listing-result__property-type').text
  # price          = parsed_page.css('.listing-result__price').text
  # suburb_address = parsed_page.css('span.css-1fclaxo').text

  house_cards = parsed_page.css('.listing-result__details-wrapper')

  # Loop through house_cards
  #    house_card.css('.listing-result__price').text

  #p house_card
  # p price.class
  #p prop_type
  # p suburb_address
  byebug
end

scraper