require_relative 'bike'

class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "No bikes available" if empty?
    @bikes.pop
  end

  def dock(bicycle, broken = true)
    raise "Docking Station full" if full?
    @bikes.push(bicycle)
    bicycle.report_broken if broken == "broken"

  end

private
def full?
  @bikes.length == @capacity
end

def empty?
  @bikes == []
end

end
