def while_loop(i, var, incr)
  numbers = []

  while i < var
    puts "At the top i is #{i}"
    numbers.push(i)

    i += incr
    puts "Numbers now: ", numbers
    puts "At the bottom i is #{i}"
  end

  puts "The numbers: "
  numbers.each { |num| puts num }

end




while_loop(0, 10, 2)
