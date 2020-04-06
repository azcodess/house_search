# class DomainView
#     def greeting
#         #user prompt to get information for URL
#   puts ' Hey there welcome to house_search! Enter the suburb you wish to search...'
#   puts 'please enter any of the following options - 1, 2, 3, 4'
#   puts "1. Aspley \n 2. Zillmere \n 3. Carseldine, 4. Logan"
    
#   max_price_input = gets.chomp
#     end

#     def input
#         gets.chomp
#     end

#     def enter_aspley
#         suburb_input = "aspley"
#         post_code = "4034"
#     end

#     def enter_zillmere
#         suburb_input= "zillmere"
#     end

#     def enter_carseldine
#         suburb_input = "carseldine"
#     end

#     def enter_logan
#         suburb_input = "logan"
#     end

#     def input
#         input = gets.chomp
#     end

#     def commands
#         suburb_input = gets.chomp
#     if input == "1"
#         enter_aspley
#         elsif input == "2"
#             enter_zillmere
#         elsif suburb_input == "3"
#             enter_carseldine
#         elsif suburb_input =="4"
#             enter_logan
#         else
#             puts "invalid input please type 1, 2, 3, 4 :)"
#             greeting
#             input

#   puts "What is the most you are willing to pay?"
#     end
# url   = "https://www.domain.com.au/rent/#{suburb_input}-qld-4034/?price=0-#{max_price_input}"

# end
def putsthis
url1 = "https://www.domain.com.au/rent/#{suburb_input}"
url2 = "-qld-#{post_code_input}/"
url3 = "?price=0-#{max_price_input}"
$url   = url1 + url2 + url3
puts $url
end
putsthis


#ONE MORE GEM TO INSTALL

# CMP1041-1.2: **Utilises** loops and conditional control
# IF STATEMENTS FOR USER INPUT
# PRG1002-5.2: **Utilises** functions from imported library structures by using them correctly to manage control flow of an application.
# 2 MORE GEMS AND USE THEM MAKE SURE THEY ARE IN YOUR BUNDLER 
# MAKE SURE TO USE BUNDLE ADD

# PRG1002-5.3: **Writes** simple functions and uses them in code
# 6 METHODS USES 5 OF THEM IN CODE

# PRG1002-3.1: **Utilises** standard input and output in a simple program

# TRY AND GET THE CSV ON THE SCREEN NOT PRIORITY
# PRG1002-3.2: **Utilises** command line arguments in a simple program

# CMP1041-1.3: **Applies** established code style and conventions in the specified programming language consistently in all code produced.
# CMP1041-4.2: **Designs** appropriate documentation or help file for a user to utilise the features of the application.
# CMP1041-4.1: **Designs** tests for main features of the application.

## TEST INPUTS

##URL TEST RECIEVING SOMETHING DO TEST LAST

# CMP1041-6.1: **Utilises** source control to version and trace the development of an application.
## GITHUB LINK IN README FILE AND 20 COMMITS
# CMP1041-6.3: **Utilises** operating system or IDE features which facilitate the execution of the application.

# BASH SCRIPT THAT INSTALL BUNDLER GEMS AND THE RUN FILE

# GET SETUP FILE OUT OF THE DOCS FOLDER BE MORE DESCRIPTIVE ABOUT SETUP