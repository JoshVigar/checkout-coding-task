require 'discountsDB'

class Discounts
  attr_accessor :discounts
  private :discounts

  def initialize()
    @discounts = DiscountsDB::DISCOUNTS
  end

  def calculatePrice(item, price, count)
    case discounts.fetch(item, nil)
    when DiscountsDB::HALF_PRICE
      return halfPrice(price, count)
    when DiscountsDB::TWO_FOR_ONE
      return twoForOne(price, count)
    else
      puts 'reached end of case'
      return price * count
    end
  end

  def halfPrice(price, count)
    return price * count / 2.0
  end

  def twoForOne(price, count)
    (count > 1) ? (price * (count % 2)) + (price * count / 2) : price * count
  end
end
