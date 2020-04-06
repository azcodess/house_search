# Installation

Please see help file located in the docs folder

# PURPOSE AND SCOPE

House Search is an application that allows the user to research the rental
 property market in the Queensland area. The user will input the suburb, 
 postcode and maximum price and get back results that match their input.
 The application is packaged as a friendly helper in order to guide the user
 to their preferred result.
 
 Searching for the right home can be daunting and some may feel uncomfortable
 doing it for the first time. In order to solve this problem the user should
 be provided with a helpful environment to help guide their decisions.
 House Search is targeted towards individuals looking into the Queensland
 rental property market for the first time and would not know where to start.
 Users get guided prompts to assist in narrowing the scope of their search thus,
 solving the problem of getting a first time user comfortable searching for 
 properties in Queensland.
 
 This application was built using the Ruby programming language and third party
 gems. This project aims to implement DRY (Don't Repeat Yourself) practises,
 test-driven development, source-control, planning and design apply the styles
  and conventions of Ruby and run without error.

## MOTIVATION

When looking at possible ideas for this project I narrowed the scope around 
data as this was a topic in technology that I was interested in.

This yielded many interesting ideas mainly around statistical data and web 
data. Statistical data seemed interesting as there are many third party 
libraries that can perform sophisticated functions on large data-sets. Web 
data was an interesting proposition because I wanted to challenge myself
to be able to extract and format web data.
Ultimately, I chose to centre this project around web data and Queensland 
real estate. The task was a simple but challenging enough - extract and format
data from domain.com.au and package it into a user-friendly experience.

## FEATURES AND FUNCTIONALITY
###  Search Results
The core feature of this app is a search tool that returns filtered results
according to the user's input. The user will input the suburb, postcode
and maximum price they are willing to pay. Under the hood the application
takes the user's input and returns results based on their input. The main
task of getting the data and converting it to something the program could 
read was done using the Nokogiri gem. This gem would read the webpage and 
return raw HTML data which is then converted to a Nokogiri document. The app
will then extract the data it needs through the ``` .css(CSS SELECTOR NAME)```
and return that data in a nokogiri nodeset. Using ```house_listings.each``` it
it groups all css selectors needed into an array and returns the information
after looping through the search results.

### User Input
Part of this assignment's requirements is to have user input in the application.
The app uses a friendly message and ```puts``` it to the screen in order to guide
the user through the process. First it asks for the suburb of interest, 
then postcode and the maximum weekly price willing to pay. This information is 
needed by the program in order to use it as a search result in the URL. The URL
structure makes it easy take in the user input and insert it into the URL. 
```https://www.domain.com.au/rent/#{suburb_input}-qld-#{post_code_input}/?price=0-#{max_price_input}```
In the URL above, variables inside the hash and curly braces(```#{}```)  are the 
input variables in the user prompt. For suburb inputs with two names a dash is
needed instead of a space. The app will then ask for the postcode of the suburb
and then finally maximum weekly rent price. The search will then return the desired
results based on the filters. 

### Create a CSV file of all results
After the results are returned the application then saves the results in a CSV
file titled ```houses.csv```.This is done using the ruby gem csv. When the results
of the search are returned ```csv.open()``` is called taking the filename, and
the preferred separator as arguments. After the ```.open()``` is called  a csv file
 is created and added to the directory.

### User Experience
When the app is launched the user is greeted with a friendly message asking for 
their desired suburb they would like to search. This is followed by a request for
the postcode and then the max price. Provided inputs are correct a message will 
popup detailing the actions just performed saying that the ```houses.csv```
file will appear in the directory once all data is returned.



# Implementation Plan
### Planning Process

Before writing any code a design and plan of the app must be written in order to
have a clear idea of features and functionality. At the beginning of my planning
process I decided to make a general purpose web crawler to test that my idea was
feasible and afterward narrow the scope in order to create a product. I settled
on data extraction from a real estate website in this case domain.com.au. 

In order to have a clear idea of functionality a flow diagram was created to 
map out the application logic. This made it easier to visualise the app's 
functionality in preparation for writing the codebase. To compliment the 
planning process I created a trello board to prioritise each feature this
included -
- Minimum Viable Product or MVP which are the features essential to the 
app's functionality

- Code design guide which shows the assignment requirements such as use of
third party gems

- Nice to haves. Features that would compliment the application but are
not needed

For more info on the trello board please visit the link below or see 
 the docs folder. 

[trello board](https://trello.com/b/D4OutWKB/housesearch "trello board")

# App structure
House_search has one main entry point of ```domainscrape.rb``` when the 
program is run using ```ruby domainscrape.rb``` the main ```def scraper``` method
is run. This method is responsible for taking user input, crawling the URL
and returning the ```houses.csv``` file.

### Variables, objects and their uses
```$file``` stores the houses.csv file that will be created after the main
method is run

```url``` is the variable that stores the URL that is used to grab data.

```unparsed_page``` is a variable that stores the unparsed url.

```parsed_page``` converts the unparsed page to a ```nokogiri::html``` 
document take ```unparsed_page``` as an argument.

```house_listings``` takes the parsed page and uses ```.css()``` to select
a div in order to narrow the search and get rid of some of the unwanted
information. A loop is the used to go through the search results and
grab the intended data.

```prop_type``` grabs the css selector for the type of property being
displayed

```suburb_address``` grabs the address and postcode

```price``` gets the weekly price of each house

```house_array``` creates an array of ```house_listings``` and pushes all
results onto the end of the array.

# Ruby Gems

Httparty is used to get the unparsed url

Nokogiri is used to convert the url to a nokogiri html document

csv is used to create a CSV file to store the data so a user can keep a
record of their search

byebug was used during the development process to assist with debugging
an unexpected crashes.

# Issues encountered 
During the early stages of development I switch IDEs to use RubyMine
as opposed to VSCode. RubyMine is free for students or for a 30 day free
trial and is purpose built for ruby development. This switch provided better
intellisense and method definitions.

When developing the application the most difficult problem to overcome
was finding the correct css selectors to get the data from. This required
inspecting the website and digging for the correct selectors. This was
difficult as a lot of them were nested deep inside the html. This posed
the biggest challenge and much of the complimentary features had to be
put on hold in order to fix the problem not getting any data returned.

# Accessibility

The application is designed for a user who is searching for properties
for the first time. The prompts guide the user to make an informed decision
and narrow the scope of their search. One aspect of the application that
can be confusing for some users is the amount of time taken to create the
file and display the results.

# Testing
Testing applications was the most daunting task of the development process
as I was unfamiliar with testing techniques.

# Links
[Github](https://github.com/azcodess/house_search)
