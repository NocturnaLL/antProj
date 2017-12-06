class Ant

  def createObject()
    raise NotImplementedError
  end

  def createAnt(factory)
    ant = factory.createObject
  end

end

class Forager
  attr_accessor :type, :agility, :health
  def initialize
    puts "Foreger created..."
    @type = "Forager"
    @agility = 1
    @health = 1
  end

  def findFood?(cell)
    find = false
    if (cell.food)
      find = true
      if(@agility<2)
        levelUp()
      end
    end
    find
  end

  def levelUp()
    @agility = @agility+1
  end

  def die()
    @health = 0
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
  attr_accessor :type, :strenght
  def initialize
    puts "Warrior created..."
    @type = "Warrior"
    @strenght = 1
    @health = 1
  end
  def levelUp()
    @strenght = @strenght + 1
  end

  def interractWarrior(warrior)
    r = rand(2)
    if (r==1)
      @warrior.levelUp()
      warrior.die()
    else
      warrior.levelUp()
      @warrior.die()
    end
  end

  def interractForeger(foreger)
    r = rand(2)
    if (r==1)
      foreger.die()
    end
  end

  def die
    warrior.health = 0
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
