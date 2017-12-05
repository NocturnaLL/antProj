
class Anthill
  attr_reader :food, :room, :strategy

  def initialize()
    @foragers=[]
    @warriors=[]
    @builders=[]
    @food=5
    @room=5
    @max_ants=15
    @current_ants=0
    @strategy=nil

    puts "Anthill created..."
  end

  def produceAnt()
    #Check max ant limit.
    #Checks food and room.
    #If pass choose strategy and build ant
    arr_of_chances = []
    initStrategy
    arr_of_chances << rand(@strategy.chances_of_forager)
    arr_of_chances << rand(@strategy.chances_of_warrior)
    arr_of_chances << rand(@strategy.chances_of_builder)
    if(@current_ants<@max_ants)
      if (isEnoughFood? && isEnoughRoom?)
        type = calculateChances(arr_of_chances)
        ant = createAnt(type)
        addAnt(ant)
        ant
      elsif (isEnoughFood?)
        puts "We need more room."
      elsif (isEnoughRoom?)
        puts "We need more food."
      else
        puts "We need more food and room"
      end
    else
      puts "We reach max number of ants"
    end
  end

  def calculateChances(arr_of_chances)
    index = arr_of_chances.index(arr_of_chances.max)
    type = 10
    if(index == 0)
      type = "Foreger"
    elsif(index == 1)
      type = "Warrior"
    elsif(index == 2)
      type = "Builder"
    end
    type
  end

  def initStrategy
    #Used Strategy Pattern to set 4 different strategies.
    #We use that strategies to produce ant.
    #Each anthill randomly choose their own strategy.
    @strategy = Strategy.new
    greedyStrategy = Greedy.new
    agressiveStrategy = Agressive.new
    constructiveStrategy = Constructive.new
    balancedStrategy = Balanced.new
    random = rand(1..4)
    if (random == 1)
      @strategy=@strategy.setStrategy(greedyStrategy)
    elsif (random == 2)
      @strategy=@strategy.setStrategy(agressiveStrategy)
    elsif (random == 3)
      @strategy=@strategy.setStrategy(constructiveStrategy)
    elsif (random == 4)
      @strategy=@strategy.setStrategy(balancedStrategy)
    end
  end

  def isEnoughFood?
    @food > 0
  end

  def isEnoughRoom?
    @room > 0
  end

  def setFood(food)
    @food = food
  end

  def setRoom(room)
    @room = room
  end

  def createAnt(type)
    #Used factory pattern, each ant has their own factory.
    #Return modified ant.
    ant = nil
    if(type == "Foreger")
      ant = Ant.new.createAnt(ForegerFactory.new)
    elsif(type == "Warrior")
      ant = Ant.new.createAnt(WarriorFactory.new)
    else
      ant = Ant.new.createAnt(BuilderFactory.new)
    end
    @food = @food -1
    @room = @room -1
    @current_ants = @current_ants + 1
    ant
  end

  def addForager(forager)
    @foragers << forager
  end

  def addWarrior(warrior)
    @warriors << warrior
  end

  def addBuilder(builder)
    @builders << builder
  end

  def addAnt(ant)
    if (ant.isForager?)
      @foragers << ant
    elsif (ant.isWarrior?)
      @warriors << ant
    elsif (ant.isBuilder?)
      @builders << ant
    end
  end

end
