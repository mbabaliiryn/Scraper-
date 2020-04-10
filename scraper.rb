require 'httparty'
require 'nokogiri'

class Scraper
  attr_accessor :parse_page

  def initialize
    url = 'https://www.nike.com/w/new-3n82y'
    doc = HTTParty.get(url).body
    @parse_page ||= Nokogiri::HTML(doc)
  end

  def names
    item_container.css('.product_name').css('p').children.map(&:text).compact
  end

  def prices
    item_container.css('.product_price').css('span.local').children.map(&:text).compact
  end

  private

  def item_container
    parse_page.css('.grid-item-info')
  end

  scraper = Scraper.new
  names = scraper.names
  prices = scraper.prices

  (0...prices.size).each do |index|
    puts "--- index: #{index + 1}---"
    puts "Name: #{names[index]} | price: #{prices[index]}"
  end
end
