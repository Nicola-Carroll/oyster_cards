class Oystercard

  attr_reader :balance

  MAX_AMOUNT = 90
  DEFAULT_AMOUNT = 0


  def initialize
    @balance = DEFAULT_AMOUNT
  end

  def top_up(amount)
    raise "Max amount exceeded" if (@balance + amount) > MAX_AMOUNT
    
    @balance += amount
  end

end

