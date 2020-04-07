# frozen_string_literal: true

require 'nokogiri'
require 'httparty'
require 'byebug'


def scraper
  url = 'https://www.indeed.com/q-Indeed-jobs.html'
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)
  jobs = []
  job_listings = parsed_page.css('div.listingCard') # 50 jobs

  page = 1
  per_page = job_listings.count # 50
  total = parsed_page.css('div.job-count').text
  last_page = per_page.to_i.round # 46

  while page <= last_page
    pagination_url = "https://www.indeed.com/q-Indeed-jobs.html/listings?page=#{page}"
    puts pagination_url
    puts "page: #{page}"
    puts ''
    pagination_unparsed_page = HTTParty.get(pagination_url)
    pagination_parsed_page = Nokogiri::HTML(pagination_unparsed_page)
    pagination_job_listings = parsed_page.css('div.listingCard')
    pagination_job_listings.each do |job_listing|
      job = {
        title: job_listing.css('span.job-title').text,
        company: job_listing.css('span.company').text,
        location: job_listing.css('span.location').text,
        url: 'https://www.indeed.com/q-Indeed-jobs.html' + job_listing.css('a')[0].attributes['href'].value

      }
      jobs << job
      puts "Added #{job[:title]}"
      puts ''
    end
    page += 1

  end
  byebug
end

scraper