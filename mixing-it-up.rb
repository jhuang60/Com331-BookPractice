# Chapter 4 Mixing it up

#Conversions (.to_s , .to_i , .to_f)
var1 = 2
var2 = '5'
puts var1.to_s + var2
puts var1 + var2.to_i

puts '15'.to_f
puts '99.999'.to_f
puts '99.999'.to_i
puts ''
puts '5 is my favorite number!'.to_i
puts 'who asked about 5 or whatever?'.to_i
puts 'your momma did.'.to_f
puts ''
puts 'stringy'.to_s
puts 3.to_i

# Another look at puts
puts 20
puts 20.to_s
puts '20'

# the gets method
puts gets

# the chomp method
puts 'Hello there, and write what\'s your name? '
#name = gets
name = gets.chomp
puts 'your name is ' + name + '? What a lovely name!'
puts 'nice to meet you, ' + name + '. :)'

#Full name greeting
puts 'Hello there, what\'s your first name? '
first = gets.chomp
puts 'what\'s your middle name? '
middle = gets.chomp
puts 'what\'s your last name? '
last = gets.chomp
puts 'nice to meet you, ' + first + ' ' + middle + ' ' + last

#Bigger, better favorite number
puts 'What\'s your favorite number? '
num = gets.chomp.to_i
newnum = num + 1
puts newnum.to_s + ' is bigger and better than ' + num.to_s
