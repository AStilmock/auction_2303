class Auction
  attr_reader :items
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    items.find_all do |item|
      item.bids.empty?
    end
  end

  def potential_revenue
    rev = 0
    items.each do |item|
      if item.current_high_bid != nil
        rev += item.current_high_bid
      end
    end
    rev
  end

  def auction_bidders
    bidders = []
    items.each do |item|
      item.bids.each do |bid|
        bidders << bid[0].name 
      end
    end
    bidders.uniq
  end

  def bidder_info
    bidder_info = Hash.new()
    items.each do |item|
      item.bids.each do |bid|
        bidder_info[bid[0]] = {}
      end
    end
    bidder_info.each do |key, value|
      items.each do |item|
        value[:budget] = key.budget
        if item.bids.keys.include?(key)
          if value[:items] == nil
            value[:items] = [item.name]
          else
            value[:items] += [item.name]
          end
        end
      end
    end
  end
end