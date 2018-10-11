class Animals
  def sound
    nil
  end
end

class Dog < Animals
  def sound
    'woof'
  end
end

class Cat < Animals
  def sound
    'meow'
  end
end

class Duck < Animals
  def sound
    'quack'
  end
end

class Snail < Animals

end

class ShibaInu < Dog
  def sound
    "#{super} wo #{super} wooooo"
  end
end

animals = [Cat.new, Dog.new, Duck.new, Snail.new]

puts animals[0].sound
puts animals[1].sound
puts animals[2].sound
puts animals[3].sound

shiba = ShibaInu.new
puts shiba.sound