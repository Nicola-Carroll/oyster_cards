class Oystercard

  attr_reader :balance, :entry_station

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

  def in_journey?
    !entry_station.nil?
  end

  def touch_in(station)
    raise "Insufficient funds" if @balance < MIN_CHARGE

    @in_use = true
    @entry_station = station
  end

  def touch_out
    deduct(1) 

    @in_use = false
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end

