require_relative 'main'



describe World do
  it "runs a world in 100 generations" do
    world = World.new
    world.start(100)
    world.generation.should eq(100)
  end
end


describe ChromossomesRandomizer do
  it "creates a randomizer which will generate a chromossome with 2 genes" do
    randomizer = ChromossomesRandomizer.new(2)
    randomizer.create().length.should eq(2)
  end
end

describe BeingFactory do
  it "builds a being with 2 genes" do
    chromossomes_randomizer = double("chromossomes_randomizer")
    chromossomes_randomizer.stub(:create => [0,0])
    being = BeingFactory.build(chromossomes_randomizer)
    being.chromossomes.length.should eq(2)
  end
end

describe PopulationFactory do
  it "builds 100 being with 3 genes" do
    chromossomes_randomizer = double("chromossomes_randomizer")
    chromossomes_randomizer.stub(:create => [0,0,0])
    beings = PopulationFactory.build(100, chromossomes_randomizer)
    beings.length.should eq(100)
    beings[0].chromossomes.length.should eq(3)
  end
end

