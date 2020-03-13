require 'nokogiri'
require 'open-uri'
require 'byebug'
require 'httparty'
require 'daru'
require 'daru/view'
require 'tty-font'

class Scraper
  def initializer
    url   = 'https://www.espn.com.au/nba/stats/team/_/table/offensive/sort/avgPoints/dir/desc'
      @vart = vart
  end

  def scraper
    unparsed_page = HTTParty.get(url)
      parse_page    = Nokogiri::HTML(unparsed_page)
      vart          = parse_page.css('table.Table.Table--align-right')
      byebug
  end

#
# def converter
#     df = Daru::DataFrame.from_html(vart)
# end
#
#     def data_frame
#         puts @df.class
#     end
end



