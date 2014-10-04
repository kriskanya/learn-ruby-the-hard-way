filename = ARGV.first

puts "we're going to erase #{filename}"
puts "if you don't want that, hit ctrl-c"
puts "if you don't want that, hit RETURN"

$stdin.gets

puts "opening the file..."
target = open(filename, 'w')

puts "truncating the file.  goodbye!"
target.truncate(0)

puts "now I'm going to ask you for three lines"

print "line 1: "
line1 = $stdin.gets.chomp
print "line 2: "
line2 = $stdin.gets.chomp
print "line 3: "
line3 = $stdin.gets.chomp

puts "I'm going to write these to the file"

target.write("#{line1}\n#{line2}\n#{line3}\n")

puts "and finally, close it"
target.close
