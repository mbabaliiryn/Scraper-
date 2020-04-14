require_relative "../lib/scraper.rb"
scraper = Scraper.new
names = scraper.names
prices = scraper.prices
puts "names", names

(0...prices.size).each do |index|
  puts "--- index: #{index + 1}---"
  puts "Name: #{names[index]} | price: #{prices[index]}"
end
