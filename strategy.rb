class Strategy
  attr_accessor :strategy
  def setStrategy(strategy)
    @strategy=strategy.setStrategy
  end
end

class Greedy
  attr_reader :type, :chances_of_forager, :chances_of_warrior, :chances_of_builder
  def setStrategy()
    @type="Greedy"
    setChances
    self
  end
  def setChances
    @chances_of_forager = 50
    @chances_of_warrior = 25
    @chances_of_builder = 25
  end
end

class Agressive
  attr_reader :type, :chances_of_forager, :chances_of_warrior, :chances_of_builder
  def setStrategy()
    @type="Agressive"
    setChances
    self
  end
  def setChances
    @chances_of_forager = 25
    @chances_of_warrior = 50
    @chances_of_builder = 25
  end
end

class Constructive
  attr_reader :type, :chances_of_forager, :chances_of_warrior, :chances_of_builder
  def setStrategy()
    @type="Constructive"
    setChances
    self
  end
  def setChances
    @chances_of_forager = 25
    @chances_of_warrior = 25
    @chances_of_builder = 50
  end
end

class Balanced
  attr_reader :type, :chances_of_forager, :chances_of_warrior, :chances_of_builder
  def setStrategy()
    @type="Balanced"
    setChances
    self
  end
  def setChances
    @chances_of_forager = 34
    @chances_of_warrior = 33
    @chances_of_builder = 33
  end
end
