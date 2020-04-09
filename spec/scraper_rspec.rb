# frozen_string_literal: true

require_relative '../scraper.rb'

describe scraper do
  it 'grabs data from a website' do
    expect ('Name: #{names[index]} ').to eql('price: #{prices[index]}')
  end
end
