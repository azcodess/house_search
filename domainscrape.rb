require 'nokogiri'
require 'byebug'
require 'httparty'
require 'csv'
require 'colorize'

$file = "houses.csv"
$aspley_file = "aspley.csv"
$zillmere_file = "zillmere.csv"
$carseldine_file = "carseldine.csv"
$windsor_file = "windsor.csv"



# def name

# end

def suburb_input
#user prompt to get information for URL
  puts ' Hey there welcome to house_search! Please which suburb you would like to search...'.colorize(:blue)
  puts '1. Aspley'
  puts '2. Zillmere'
  puts '3. Carseldine'
  puts '4. Logan'
    while suburb_input = input
        case suburb_input
        when "1"
            puts "you've chosen Aspley :)"
            # #method to put in aspley and postcode into the string
            get_aspley_data
            break
        when "2"
            puts "you've chosen Zillmere :)"
            get_zillmere_data
            break
        when "3"
            puts "you've chosen Carseldine :)"
            break
        when "4"
            puts "you've chosen Windsor :)"
            get_windsor_data
            break
        else 
            puts " please select 1 of the 4 options"
            puts '1. Aspley'
            puts '2. Zillmere'
            puts '3. Carseldine'
            puts '4. Windsor'
        end
    end
end


def input
    gets.chomp
end

def get_aspley_data
  url = "https://www.domain.com.au/rent/aspley-qld-4034/?price=0-900"
  
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

    CSV.open($aspley_file, "ab", {:col_sep => "|"}) do |csv|
      csv << [prop_type, price, suburb_address]
        end
    end
end

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

    CSV.open($zillmere_file, "ab", {:col_sep => "|"}) do |csv|
      csv << [prop_type, price, suburb_address]
        end
    end
end

def get_carseldine_data
  url = "https://www.domain.com.au/rent/carseldine-qld-4034/?price=0-900"
  
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

    CSV.open($carseldine_file, "ab", {:col_sep => "|"}) do |csv|
      csv << [prop_type, price, suburb_address]
        end
    end
end

def get_windsor_data
  url = "https://www.domain.com.au/rent/windsor-qld-4030/?price=0-900"
  
  unparsed_page = HTTParty.get(url)
  parsed_page    = Nokogiri::HTML(unparsed_page)

  house_listings = parsed_page.css('.listing-result__details')
  house_listings.each do |hl|
    prop_type      = hl.css('.listing-result__property-type')[0]
    price          = hl.css('.listing-result__price')[0]
    suburb_address = hl.css('span[itemprop=streetAddress]')[0]

    house_array = [house_listings]
    house_array.push("#{prop_type} #{price}")

      CSV.open($windsor_file, "ab", {:col_sep => "|"}) do |csv|
      csv << [prop_type, price, suburb_address]
        end
    end
end

suburb_input