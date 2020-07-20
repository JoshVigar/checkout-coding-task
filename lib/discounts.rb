require 'discountsDB'

class Discounts
  attr_accessor :discounts
  private :discounts

  def initialize()
    @discounts = DiscountsDB::DISCOUNTS
  end

  def calculatePrice(item, price, count)
    case discounts.fetch(item, nil)
    when DiscountsDB::HALF_PRICE_RESTRICTED
      return halfPriceRestricted(price, count)
    when DiscountsDB::HALF_PRICE
      return halfPrice(price, count)
    when DiscountsDB::TWO_FOR_ONE
      return twoForOne(price, count)
    when DiscountsDB::THREE_FOR_TWO
      return threeForTwo(price, count)
    else
      puts 'reached end of case'
      return price * count
    end
  end

  def halfPrice(price, count)
    return price * count / 2.0
  end

  def halfPriceRestricted(price, count)
    return (price * (count - 1)) + (price / 2)
  end

  def twoForOne(price, count)
    return(
      (count > 1) ? (price * (count % 2)) + (price * count / 2) : price * count
    )
  end

  def threeForTwo(price, count)
    return price * (count - (count / 3))
  end
end
