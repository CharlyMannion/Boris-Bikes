require 'docking_station'

describe DockingStation do
  it 'has a bike method' do
      is_expected.to respond_to(:bikes)
  end

describe '#initialize' do
  it 'should have a capacity' do
    is_expected.to respond_to(:capacity)
  end
  it 'should have a capacity of DefaultCapacity if no capacity is given' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end
  it 'should allow the maintainer to set the capacity' do
    station = DockingStation.new(10)
    expect(station.capacity).to eq 10
  end
end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
      expect(subject.bikes).to eq []

    end
    it 'raises an error when no bikes available' do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end
    it 'raise error when bike is broken' do
      subject.dock(Bike.new, "broken")
      expect { subject.release_bike}.to raise_error "Bike Broken"
    end
    it 'release one working bike if there is one' do
      bike2 = Bike.new
      subject.dock(bike2)
      subject.dock(Bike.new, "broken")
      expect(subject.release_bike).to eq bike2
    end
  
  end

  describe '#dock' do
    it 'raises an error when docking station is full' do
      station = DockingStation.new(30)
      station.capacity.times {station.dock Bike.new} # No need to declare bike instance seprately bike = Bike.new
      expect { station.dock Bike.new }.to raise_error "Docking Station full" #bike2 = Bike.new
    end
    it 'returns bike when its docked' do
      bicycle = Bike.new
      subject.dock(bicycle)
      expect(subject.bikes).to eq [bicycle]
    end
    it 'should return bike is broke when the bike is reported "broken"' do
      bicycle = Bike.new
      subject.dock(bicycle, "broken")
      expect(bicycle.working).to eq false
    end
  end
end
