class Journey

  def initialize(entry_station=nil, exit_station=nil)
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def complete?
    @entry_station && @exit_station
  end

  def fare
    complete? ? 1 : 6
  end

  def finish(station=nil)
    @exit_station = station
  end

end