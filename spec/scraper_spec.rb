require_relative "../scraper.rb"
describe Scraper do
  describe "names" do
    it "prints out an empty string" do
      expect(p(names)).to eq([])
    end
  end

  describe "prices" do
    it "prints out an empty string" do
      expect(p(prices)).to eql([])
    end
  end
end
