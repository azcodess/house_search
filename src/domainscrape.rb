require 'nokogiri'
require 'byebug'
require 'httparty'
require 'csv'
require 'colorize'
require 'tty-font'
require_relative './domainscrape'

$aspley_file = "aspley.csv"
$zillmere_file = "zillmere.csv"
$carseldine_file = "carseldine.csv"
$windsor_file = "windsor.csv"

$font = TTY::Font.new(:doom)

def suburb_input
#user prompt to get information for URL
  puts $font.write("House Search")
  puts ' Hey there welcome to house_search! Please which suburb you would like to search...'
  puts '1. Aspley'.colorize(:red)
  puts '2. Zillmere'.colorize(:blue)
  puts '3. Carseldine'.colorize(:yellow)
  puts '4. Windsor'
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
            get_carseldine_data
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
  search_complete
end

def get_zillmere_data
  url = "https://www.domain.com.au/rent/zillmere-qld-4034/?price=0-900"
  
  unparsed_page = HTTParty.get(url)
  parsed_page    = Nokogiri::HTML(unparsed_page)

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
  File.open($zillmere_file, "ab") do |f|
    data = house_listings_data.map{ |d| d.to_csv(col_sep: "|") }.join
    f.write(data)
  end
  search_complete
end

def get_carseldine_data
  url = "https://www.domain.com.au/rent/carseldine-qld-4034/?price=0-900"
  
  unparsed_page = HTTParty.get(url)
  parsed_page    = Nokogiri::HTML(unparsed_page)

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
  File.open($carseldine_file, "ab") do |f|
    data = house_listings_data.map{ |d| d.to_csv(col_sep: "|") }.join
    f.write(data)
  end
  search_complete
end

def get_windsor_data
  url = "https://www.domain.com.au/rent/windsor-qld-4030/?price=0-900"
  
  unparsed_page = HTTParty.get(url)
  parsed_page    = Nokogiri::HTML(unparsed_page)

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
  File.open($windsor_file, "ab") do |f|
    data = house_listings_data.map{ |d| d.to_csv(col_sep: "|") }.join
    f.write(data)
  end
  search_complete
end


def search_complete
  puts "would you like to search again? y/n"
  repeat_search = input
  while repeat_search
    case repeat_search
    when "y"
      suburb_input
      break
    when "n"
      goodbye
      break
    else
      puts "invalid input please type yes or no :)"
      suburb_input
    end
  end
end


def goodbye
  puts "Thanks for using - "
  puts $font.write("House Search")
  exit
end

def input
    gets.chomp
end

suburb_input