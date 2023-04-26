require 'rspec'
require './lib/item'
require './lib/attendee'
require './lib/auction'

RSpec.describe Auction do
  before(:each) do
    @auction = Auction.new
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
  end

  describe '#initialize' do
    it 'exists' do
      expect(@auction).to be_a(Auction)
    end

    it 'has auction attributes' do
      expect(@auction.items).to eq([])
    end
  end

  describe 'add_items method' do
    it 'adds items' do
      @auction.add_items(@item1)
      @auction.add_items(@item2)
      expect(@auction.items).to eq([@item1, @item2])
    end

    it 'checks item names' do
      @auction.add_items(@item1)
      @auction.add_items(@item2)
      expect(@auction.item_names).to eq(['Chalkware Piggy Bank', 'Bamboo Picture Frame'])
    end
  end
end