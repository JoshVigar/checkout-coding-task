require 'discounts'
class Checkout
  attr_reader :prices
  private :prices
  attr_reader :discounts
  private :discounts

  def initialize(prices)
    @prices = prices
    @discounts = Discounts.new
  end

  def scan(item)
    basket << item.to_sym
  end

  def total
    total = 0

    basket.inject(Hash.new(0)) do |items, item|
      items[item] += 1
      items
    end.each do |item, count|
      total += discounts.calculatePrice(item, prices.fetch(item), count)
    end

    total
  end

  private

  def basket
    @basket ||= Array.new
  end
end
