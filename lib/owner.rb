class Owner
  
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self

  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    Owner.all.clear
  end

  def cats
    Cat.all.find_all { |cat| cat.owner == self }
  end

  def dogs
    Dog.all.find_all { |dog| dog.owner == self }
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
    # personal note - self here refers to the Owner instance that it's being called on
  end
  
  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    dogs.map {|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.map {|cat| cat.mood = "happy"}
  end

def sell_pets
  cats.map do |cat|
    cat.mood = "nervous"
    cat.owner = nil
  end

  dogs.map do |dog|
    dog.mood = "nervous"
    dog.owner = nil
  end
end

def list_pets
  "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
end

end