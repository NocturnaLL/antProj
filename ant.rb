class Ant

  def createObject()
    raise NotImplementedError
  end

  def createAnt(factory)
    ant = factory.createObject
  end

end

class Forager
  attr_reader :type
  def initialize
    puts "Foreger created..."
    @type = "Forager"
  end
  def isForager?
    @type == "Forager"
  end

  def isWarrior?
    @type == "Warrior"
  end

  def isBuilder?
    @type == "Builder"
  end
end


class Warrior
  attr_reader :type
  def initialize
    puts "Warrior created..."
    @type = "Warrior"
  end
  def isForager?
    @type == "Forager"
  end

  def isWarrior?
    @type == "Warrior"
  end

  def isBuilder?
    @type == "Builder"
  end
end

class Builder
  attr_reader :type
  def initialize
    puts "Builder created..."
    @type = "Builder"
  end
  def isForager?
    @type == "Forager"
  end

  def isWarrior?
    @type == "Warrior"
  end

  def isBuilder?
    @type == "Builder"
  end
end
