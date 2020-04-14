require "rspec"
require_relative "../lib/scraper"
describe Scraper do
  let(:scraper) { Scraper.new }

  describe "#prices" do
    it "should be an instance of Array" do
      expect(scraper.prices).to be_instance_of Array
    end
    it "should be a non empty array" do
      expect(scraper.prices).not_to be_empty
    end
  end
end
