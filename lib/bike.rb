class Bike

  def initialize
    @working = true
    @broken = false
  end

  def working?
    @working
  end

  def report_broken
    @broken = true
  end

  def broken?
    @broken = true
    @working = false
  end

end
