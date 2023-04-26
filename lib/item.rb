class Item
  attr_reader :name, :bids
  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(person, amount)
    if bids[person] == nil
      bids[person] = amount
    end
  end

  def current_high_bid
    bids.values.max()
  end
end