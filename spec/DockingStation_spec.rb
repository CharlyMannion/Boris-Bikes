require 'docking_station'
require 'bike'

describe DockingStation do
  docking_station = DockingStation.new
  bike = Bike.new
  it { is_expected.to respond_to :release_bike }
  it 'expects bike to be working when it gets a bike' do
    expect(bike.working).to eq true
  end
end
