require 'nokogiri'
require 'byebug'
require 'httparty'

$file = "houses.csv"
$fortitude_valley = "fortitude valley"
$aspley = "aspley"
$zillmere = "zillmere"

def house_search
    puts "please choose one of the options below"
    puts "1. "
end

# CMP1041-2.1: **Plans** user interactions with the application.
# CMP1041-1.2: **Utilises** loops and conditional control
# PRG1002-5.2: **Utilises** functions from imported library structures by using them correctly to manage control flow of an application.
# PRG1002-5.3: **Writes** simple functions and uses them in code
# PRG1002-3.1: **Utilises** standard input and output in a simple program
# PRG1002-3.2: **Utilises** command line arguments in a simple program
# CMP1041-1.3: **Applies** established code style and conventions in the specified programming language consistently in all code produced.
# CMP1041-4.2: **Designs** appropriate documentation or help file for a user to utilise the features of the application.
# CMP1041-4.1: **Designs** tests for main features of the application.
# CMP1041-6.1: **Utilises** source control to version and trace the development of an application.
# CMP1041-6.3: **Utilises** operating system or IDE features which facilitate the execution of the application.

# prompt = "> "
# puts "Question asking for 1 or 2."
# print prompt

# while user_input = gets.chomp # loop while getting user input
#   case user_input
#   when "1"
#     puts "First response"
#     break # make sure to break so you don't ask again
#   when "2"
#     puts "Second response"
#     break # and again
#   else
#     puts "Please select either 1 or 2"
#     print prompt # print the prompt, so the user knows to re-enter input
#   end
# end