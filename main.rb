

class ChromossomesRandomizer
  def initialize(genes_count, seed = Random.new_seed)
    srand seed
    @genes_count = genes_count
  end

  def create
    Array.new(@genes_count).map { |item| rand.round(2) }
  end
end

class BeingFactory
  def self.build(chromossomes_randomizer)
    Being.new(chromossomes_randomizer.create())
  end
end

class PopulationFactory
  def self.build(beings_count, chromossomes_randomizer)
    beings = []
    (1..beings_count).each do
      beings.push(Being.new(chromossomes_randomizer.create()))
    end
    beings
  end
end


class Being
  attr_accessor :chromossomes, :breath

  def initialize(chromossomes)
    @chromossomes = chromossomes
  end

end



class World
  attr_accessor :generation, :population

  def initialize(population)
    @generation = 0
    @population = population
  end

  def start(generations)
    (1..generations).each do
      @generation += 1
    end
  end
end


