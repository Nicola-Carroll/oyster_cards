require './lib/journey'

class JourneyLog

  def initialize(journey_class: Journey.new)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
    @journey_class = Journey.new(station)
  end

  def finish(station=nil)
    current_journey.finish(station)
    @journeys << @journey_class
    @journey_class = nil
  end

  def journeys
    @journeys
  end

  private

  def current_journey
    @journey_class.nil? ? @journey_class = Journey.new : @journey_class
  end

end