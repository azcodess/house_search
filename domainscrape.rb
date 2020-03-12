require 'nokogiri'
require 'open-uri'
require 'byebug'
require 'httparty'
require_relative 'methods'
# #
#  puts "hi please enter a suburb"
# suburb_input = gets.chomp
# puts "now a post code"
# post_code_input = gets.chomp
# puts "what is your "
# max_price_input = gets.chomp
# house_details = [suburb_input, post_code_input, max_price_input]


# class Domain_Scraper
#   attr_accessor :suburb_input, :post_code_input, :max_price_input
#
#   def initialize(suburb_input, post_code_input, max_price_input)
#     @max_price_input = max_price_input
#     @post_code_input = post_code_input
#     @suburb_input = suburb_input
#   end
def domain_scraper

  puts 'enter the suburb you wish to search \nNOTE a '
  suburb_input = gets.chomp
  puts "now the postcode of that suburb"
  post_code_input = gets.chomp
  max_price_input = gets.chomp

  url2   = "https://www.domain.com.au/rent/#{suburb_input}-qld-#{post_code_input}/?price=0-#{max_price_input}"
  #url2 = "https://www.domain.com.au/rent/#{house[0]}-qld-#{house[1]}/?price=0-#{house[2]}"

  puts url2
  unparsed_page = HTTParty.get(url2)
  parsed_page    = Nokogiri::HTML(unparsed_page)

  house_listings = parsed_page.css('.listing-result__details')

  house_array = []

  house_listings.each do |hl|
    prop_type      = hl.css('.listing-result__property-type')[0].text
    price          = hl.css('.listing-result__price')[0].text
    suburb_address = hl.css('.css-1fclaxo')[0].text
    address_locality = hl.css('')[0].text
    address_region = hl.css('')[0].text
    postal_code = hl.css('')[0].text

    house_array.push("#{prop_type} #{price} #{suburb_address} #{address_locality} #{address_region} #{postal_code}")
    # house_array.push("#{prop_type} #{price} #{suburb_address}")
      byebug
  end
  for i in house_array
    puts i
      end
end
# end


domain_scraper
# def scrap_fn(topic, limit_page)
#
#   puts 'SCRAPING FRASECELEBRE.NET'
#
#   for page in 0..limit_page
#     puts "reading page #{page} - #{topic}"
#
#     url = "http://www.frasecelebre.net/Frases_De_"+topic+".html"
#     url = "http://www.frasecelebre.net/Frases_De_"+topic+"_"+page.to_s+".html" if page != 0
#
#     doc = Nokogiri::HTML(open(url))
#     quotes = doc.css("div.bq")
#
#     quotes.css(".q").each do |q|
#       quote = q.css(".Frase blockquote")[0].text
#       author = q.css(".social_links a")[0].text
#       topic = "sueño" if topic == "sueno"
#
#       CSV.open($file, "ab", {:col_sep => "|"}) do |csv|
#         csv << [quote, author, topic, "frasecelebre.net", "es"]
#       end
#       topic = "sueno" if topic == "sueño"
#     end
#
#   end


# def scraping_loop
#   unless
#   end
# end


    #     quotes = doc.css("div.bq")
    #
    #     quotes.css(".q").each do |q|
    #       quote = q.css(".Frase blockquote")[0].text
    #       author = q.css(".social_links a")[0].text
    #       topic = "sueño" if topic == "sueno"




    # ENTIRE DIV YOU NEED ---- listing-result__details-wrapper
    # Loop through house_cards
    #    house_card.css('.listing-result__price').text