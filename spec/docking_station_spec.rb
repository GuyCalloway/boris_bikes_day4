require 'docking_station'


describe DockingStation do

  describe '#release_bike' do

    let(:bike) { double :bike }

    it 'raises an error when there is no avaible bikes' do
      expect {subject.release_bike}.to raise_error 'No bikes available'
    end

    it 'release only working bikes, fail if none available' do

      bike = double("bike", :working? => false)
      subject.dock bike
      expect{subject.release_bike}.to raise_error 'No bikes available'
    end

    it 'release only working bikes' do
      bike = double("bike", :working? => true)
      subject.dock bike
      expect(subject.release_bike).to eq bike
    end

  end

  describe '#dock' do

    let(:bike) { double :bike }

    it { is_expected.to respond_to(:dock).with(1).argument }


    it 'docks bike' do
      expect(subject.dock(bike)).to eq bike
    end

  end

  describe '#initialize' do

  let(:bike) { double :bike }

    subject {DockingStation.new}

    it 'defaults capacity' do
      DockingStation::DEFAULT_CAPACITY.times do
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
