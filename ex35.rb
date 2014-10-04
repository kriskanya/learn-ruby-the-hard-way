def gold_room
  puts "This room is full of gold.  How much do you take?"
  print "> "
  choice = $stdin.gets.chomp

  if choice.match(/[\d]/)
    how_much = choice.to_i
  else
    dead("Man, learn to type a number.")
  end

  if how_much < 50
    puts "Nice, you're not greedy; you win"
    exit(0)
  else
    dead("You greedy bastard")
  end
end

def bear_room
  puts "there is a bear here"
  puts "the bear has a bunch of honey"
  puts "the fat bear is in front of another door"
  puts "how are you going to move the bear?"
  bear_moved = false

  while true
    print "> "
    choice = $stdin.gets.chomp

    if choice == "take honey"
      dead("the bear looks at you and then slaps your face off")
    elsif choice == "taunt bear" && !bear_moved
      puts "the bear has moved from the door.  you can go through it now"
      bear_moved = true
    elsif choice == "taunt bear" && bear_moved
      dead("the bear chews your leg off")
    elsif choice == "open door" && bear_moved
      gold_room
    else
      puts "I have no idea what that means"
    end
  end
end

def cthulhu_room
  puts "here you see the great evil Cthulhu"
  puts "he stares at you and you go insane"
  puts "do you flee for your life or eat your head?"

  print "> "
  choice = $stdin.gets.chomp

  if choice.include? "flee"
    start
  elsif choice.include? "head"
    dead("well that was tasty")
  else
    cthulhu_room
  end
end

def dead(why)
  puts why, "you're dead!"
  exit(0)
end

def start
  puts "you are in a dark room"
  puts "there is a door to your right and left"
  puts "which one do you take?"

  print "> "
  choice = $stdin.gets.chomp

  if choice == "left"
    bear_room
  elsif choice == "right"
    cthulhu_room
  else
    dead("You stumble across the room until you starve")
  end
end

start
