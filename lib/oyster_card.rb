require './lib/journey_log'
require './lib/journey'

class Oystercard
  attr_reader :balance
  
  MAX_AMOUNT = 90
  DEFAULT_AMOUNT = 0
  MIN_CHARGE = 1

  def initialize(amount=DEFAULT_AMOUNT, journeys = JourneyLog.new(journey_class: Journey))
    @balance = amount
    @journeys = journeys
  end

  def top_up(amount)
    raise "Max amount exceeded" if (@balance + amount) > MAX_AMOUNT

    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient funds" if @balance < MIN_CHARGE

    @journeys.start(station)
  end

  def touch_out(station=nil)
    @journeys.finish(station)
    deduct(@journeys.journeys.last.fare) 
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end

