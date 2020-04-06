require 'test/unit'
require_relative '../src/domainscrape'

class DomainTest < Test::Unit::TestCase
    
    def test_parse_aspley_page(unparsed_page)
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

     return house_listings_data
    end

    def test_save_house_listings(house_listings, file:)
    File.open(file, "ab") do |f|
        data = house_listings.map{ |d| d.to_csv(col_sep: "|") }.join
        f.write(data)
    end
    end

    def test_get_aspley_data(url, file: $aspley_file)
    save_house_listings(
        parse_aspley_page(HTTParty.get(url))
    )
    end
end