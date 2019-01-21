# Chapter 6 more about methods

# -------------------------------------------------------------------> exercises
#Angry boss
puts ''
puts '--------------> Angry boss'
puts ''

puts 'Tell something to your boss'
comment = gets.chomp
puts 'Boss: WHAT YOU MEAN ' + comment.upcase + '?!' + "YOU\'RE FIRED!"

#Table of content
puts ''
puts '--------------> Table of content'
puts ''

line_width = 50
puts ('Table of content'.center(line_width))
puts ''
puts ('Chapter 1:'.ljust(line_width/4) + 'Getting started'.ljust(line_width/2) + 'Page '.ljust(line_width/8) + ' 1'.rjust(0))
puts ('Chapter 2:'.ljust(line_width/4) + 'Numbers'.ljust(line_width/2) + 'Page '.ljust(line_width/8) + ' 9'.rjust(0))
puts ('Chapter 3:'.ljust(line_width/4) + 'Letters'.ljust(line_width/2) + 'Page '.ljust(line_width/8) + '13'.rjust(0))
#<------------------------------------------------------------------------
=begin
#.reverse
puts '--------------> reverse'
puts ''
var = 'dog'
puts var.reverse
puts var
puts var + 's are gifts from ' + var.reverse



#.length
puts ''
puts '--------------> .length'
puts ''

puts 'what\s your full name?'
name = gets.chomp
puts 'there are ' + name.length.to_s + ' characters in your name'

#.upcase .downcase .swapcase .capitalize
puts ''
puts '-------------->.upcase .downcase .swapcase .capitalize'
puts ''

letters = 'aAbBcCdD'
puts letters.upcase
puts letters.downcase
puts letters.swapcase
puts letters.capitalize
puts ' a'.capitalize
puts letters



#.center .ljust .rjust
puts ''
puts '--------------> .center .ljust .rjust'
puts ''

line_width = 50
puts ('roses are red'.center(line_width))
puts ('You have a phone'.center(line_width))
puts ('Nobody texts you?'.center(line_width))
puts ('Your\'re forever alone'.center(line_width))

str =' --> text <--'
puts (str.ljust(line_width))
puts (str.center(line_width))
puts (str.rjust(line_width))
puts (str.ljust(line_width/2) + str.rjust(line_width/2))

# More Arithmetic
puts ''
puts '--------------> More Arithmetic'
puts ''
puts 5**2
puts 5**0.5
puts 7 / 3
puts 7 % 3
puts 365 % 7

# Random numbers
puts ''
puts '--------------> Random numbers'
puts ''

puts rand
puts rand
puts rand
puts (rand(100))
puts (rand(100))
puts (rand(100))
puts (rand(1))
puts (rand(1))
puts (rand(1))
puts (rand(9999999999999999999))
puts ('the weatherman said there is a ')
puts (rand(101).to_s + '% chance of rain,')
puts ('but you can never trust the weatherman')

# setting a seed with srand
puts ''
puts '--------------> srand'
puts ''

srand 1976
puts (rand(100))
puts (rand(100))
puts (rand(100))
puts (rand(100))
puts ''
srand 1976
puts (rand(100))
puts (rand(100))
puts (rand(100))
puts (rand(100))

#The math object
puts ''
puts '--------------> The math object'
puts ''

puts (Math:: PI)
puts (Math:: E)
puts (Math.cos(Math:: PI/3))
puts (Math.tan(Math:: PI/4))
puts (Math.log(Math:: E**2))
puts ((1 + Math.sqrt(5))/2)
=end
