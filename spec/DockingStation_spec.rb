require 'docking_station'

describe DockingStation do
  it 'has a bike method' do
      is_expected.to respond_to(:bikes)
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
  end

  describe '#dock' do
    it 'raises an error when docking station is full' do
      20.times {subject.dock Bike.new} # No need to declare bike instance seprately bike = Bike.new
      expect { subject.dock Bike.new }.to raise_error "Docking Station full" #bike2 = Bike.new
    end
    it 'returns bike when its docked' do
      bicycle = Bike.new
      subject.dock(bicycle)
      expect(subject.bikes).to eq [bicycle]
    end
  end
end
