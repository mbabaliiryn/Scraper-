require_relative '../scraper.rb'

describe scraper do
    it 'grabs data from a website' do
        expect {"Added #{job[:title]}"}.to eql(text)
    end

end