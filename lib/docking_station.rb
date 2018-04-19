require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "No bikes available" if @bikes == []
    @bikes.pop
  end

  def dock(bicycle)
    raise "Docking Station full" if @bikes.length == 20
    @bikes.push(bicycle)
  end

end
