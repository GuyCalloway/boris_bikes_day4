require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  attr_reader :bikes, :bike
  attr_accessor :capacity

  def dock(bike)
    fail 'Docking station is full' if full?
    @bikes << bike
    bike
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  private

  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.count >= capacity
  end

end