require File.expand_path('../anthill.rb', __FILE__)
require File.expand_path('../ant.rb', __FILE__)
require File.expand_path('../foregerfactory.rb', __FILE__)
require File.expand_path('../warriorfactory.rb', __FILE__)
require File.expand_path('../builderfactory.rb', __FILE__)
require File.expand_path('../strategy.rb', __FILE__)


def main()
  a = Anthill.new
  puts a.produceAnt
end

main
