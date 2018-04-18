require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it 'releases working bikes' do
    bike = subject.release_bike
    expect(bike).to be_working
  end
  it 'accepts a bike when we dock' do
    bike = subject.release_bike
    expect(bike).to be_dock
  end
  end
