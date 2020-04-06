require 'nokogiri'
require 'byebug'
require 'httparty'
require 'csv'
require 'colorize'
require 'tty-font'

require_relative 'house_search'

$file = "houses.csv"
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


def input
    gets.chomp
end

suburb_input