class Oystercard

  attr_reader :balance, :in_use

  MAX_AMOUNT = 90
  DEFAULT_AMOUNT = 0
  MIN_CHARGE = 1

  def initialize
    @balance = DEFAULT_AMOUNT
    @in_use = false
  end

  def top_up(amount)
    raise "Max amount exceeded" if (@balance + amount) > MAX_AMOUNT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_use
  end

  def touch_in
    raise "Insufficient funds" if @balance < MIN_CHARGE

    @in_use = true
  end

  def touch_out
    @in_use = false
  end




end

