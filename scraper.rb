require 'httparty'
require 'nokogiri'

class Scraper
attr_accessor :parse_page

  def initialize
    url = "https://nike.com"
    doc = HTTParty.get(url).body
    @parse_page ||= Nokogiri::HTML(doc)
  

    end

    def get_names
        item_container.css(".product_name").css("p").children.map { |name| name.text }.compact
    end

    def get_prices
        item_container.css(".product_price").css("span.local").children.map { |price| price.text }.compact
    end


    private

    def item_container
        parse_page.css(".grid-item-info")
        
    end

end

scraper = Scraper.new
names = scraper.get_names
prices = scraper.get_names

(0...prices.size).each do |index|
puts "--- index: #{index + 1}---"
puts "Name: #{names[index]} | price: #{prices[index]}"
end



