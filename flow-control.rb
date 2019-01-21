#Chapter 7 Flow control

#Exercises

puts ''
puts '----------------------------> 99 bottles of beer on the wall'
puts ''

num = 3
while num > 0
  puts num.to_s + ' bottles of beer on the wall ' + num.to_s + ' bottles of beer'
  num = num - 1
  if num == 0
    puts 'take one down, pass it around. No bottles of beer on the wall'
  else
    puts 'take one down, pass it around ' + num.to_s + ' bottles of beer on the wall'
  end
end

puts ''
puts '----------------------------> Deaf Grandma'
puts ''

count = 0
while true
  speak = gets.chomp
  if speak == 'BYE'
    puts 'BYE BYE'
    break
  end
  if speak != speak.upcase
    puts 'HUH?! SPEAK UP, SONNY!'
  else
    year = 1930 + rand(21)
    puts 'NOT SINCE ' + year.to_s + '!'
  end
end

puts ''
puts '----------------------------> Deaf Grandma Extended'
puts ''

while true
  speak = gets.chomp
  if speak == 'BYE'
    count = count + 1
  else
    count = 0
  end
  if count >= 3
    puts 'BYE BYE'
    break
  end
  if speak != speak.upcase
    puts 'HUH?! SPEAK UP, SONNY!'
  else
    year = 1930 + rand(21)
    puts 'NOT SINCE ' + year.to_s + '!'
  end
end

puts ''
puts '------------------------------------------> Leap Year'
puts ''

puts 'Pick a starting year: '
starty = gets.chomp.to_i
puts 'Pick an ending year: '
endy = gets.chomp.to_i
while starty <= endy
  if starty%4 == 0
      if starty%100 != 0 || starty%400 == 0
        puts starty.to_s + ' is a leap year'
      end
  end
  starty = starty + 1
end

=begin
#Comparison methods
puts ''
puts '----------------------------> Comparison methods'
puts ''

puts 1 > 2
puts 1 < 2
puts 5 >= 5
puts 5 <= 4
puts 1 == 1
puts 2 != 1
puts 'cat' < 'dog'
puts 'bug lady' < 'Xander'
puts 'bug lady'.downcase < 'Xander'.downcase
puts 2 < 10
puts '2' < '10'

#Branching
puts ''
puts '----------------------------> Branching'
puts ''

puts 'Hello, what\'s your name?'
name = gets.chomp
puts 'Hello, ' + name + '.'
if name == 'Chris'
  puts 'what a lovely name!'
else
  puts 'what a cute name!'
end
puts ''

puts 'Hello, welcome to my English class'
puts 'What\s your name?'
name = gets.chomp
if name == name.capitalize
  puts 'Take a seat, ' + name +'.'
else
  puts name + '? You mean ' + name.capitalize + 'right?'
  puts 'Don\'t you know how to spell your name? '
  reply = gets.chomp
  if reply === 'yes'
    puts 'ok well'
  else
    puts 'you will learn how to spell in this class'
  end
end

#looping
puts ''
puts '------------------------------------------> Looping'
puts ''

input = ''
while input != 'bye'
  puts input
  input = gets.chomp
end
puts 'come again soon!'
puts ''

while true
  input = gets.chomp
  puts input
  if input == 'bye'
    break
  end
end
puts 'come again soon!'

#a little bit of logic
puts ''
puts '------------------------------------------> a little bit of logic'
puts ''
puts 'Hello, what\'s your name?'
name = gets.chomp
puts 'Hello, ' + name + '.'
if name == 'Chris'
  puts 'what a lovely name!'
elsif name == 'Katy'
  puts 'what a lovely name!'
end

puts ''

puts 'Hello, what\'s your name?'
name = gets.chomp
puts 'Hello, ' + name + '.'
if name == 'Chris' || name == 'Katy'
  puts 'what a lovely name!'
end
=end
