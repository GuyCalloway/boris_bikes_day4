require 'docking_station'
require 'bike'

describe DockingStation do
  describe '#release_bike' do
    it 'raises an error when there is no avaible bikes' do
      expect {subject.release_bike}.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do

    it { is_expected.to respond_to(:dock).with(1).argument }


    it 'docks bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end

    it 'returns docked bikes' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end

  end

  describe '#initialize' do
    subject {DockingStation.new}
    let(:bike) {Bike.new}
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike)}.to raise_error 'Docking station is full'
    end
  end

  it 'has default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it { is_expected.to respond_to :release_bike }

  it {is_expected.to respond_to(:bikes)}



end
