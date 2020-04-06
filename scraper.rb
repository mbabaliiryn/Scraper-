require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
    url = "https://www.indeed.com/"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    byebug
end

scraper

