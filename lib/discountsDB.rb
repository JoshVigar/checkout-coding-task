class DiscountsDB
  attr_reader :discounts
  public :discounts

  HALF_PRICE = 'half_price'
  TWO_FOR_ONE = 'two_for_one'

  DISCOUNTS = { apple: TWO_FOR_ONE, banana: HALF_PRICE }
end
