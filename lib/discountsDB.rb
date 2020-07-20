class DiscountsDB
  attr_reader :discounts
  public :discounts

  HALF_PRICE = 'half_price'
  HALF_PRICE_RESTRICTED = 'half_price_restricted'
  TWO_FOR_ONE = 'two_for_one'

  DISCOUNTS = {
    apple: TWO_FOR_ONE,
    pear: TWO_FOR_ONE,
    banana: HALF_PRICE,
    pineapple: HALF_PRICE_RESTRICTED
  }
end
