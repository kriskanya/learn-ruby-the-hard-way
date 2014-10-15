# "is-a"
# "has-a"

# Animal is-a object
class Animal
end

# Dog is-a Animal
class Dog < Animal

  def initialize(name)
    # Dog has-a name
    @name = name
  end
end

# Cat is-a Animal
class Cat < Animal
  def initialize(name)
    # Cat has-a name
    @name = name
  end
end

# Person is-a object
class Person
  def initialize(name)
    # Person has-a name
    @name = name

    # Person has-a pet of some kind
    @pet = nil
  end

  attr_accessor :pet
end

# Employee is-a Person
class Employee < Person
  attr_accessor :name, :salary

  def initialize(name, salary)
    # Person has-a name ??
    super(name)
    # Employee has-a salary
    @salary = salary
  end
end

bob = Employee.new('bob', 10000)
puts bob.name

# example of super:
class Animal
  def move
    "I can move"
  end
end

class Bird < Animal
  def move
    super + " by flying"
  end
end

puts Animal.new.move
puts Bird.new.move

  # => I can move
  # => I can move by flying

# Fish is-a object
class Fish
end

# Salmon is-a Fish
class Salmon < Fish
end

# rover is-a Dog
rover = Dog.new("Rover")

# mary is a Person
mary = Person.new("Mary")

# smokey is a cat
smokey = Cat.new("Satan")

# mary has-a pet, smokey
mary.pet = smokey

# frank has-a name of "Frank", frank has-a salary of 120000
frank = Employee.new("Frank", 120000)

# flipper is-a Fish
flipper = Fish.new()
