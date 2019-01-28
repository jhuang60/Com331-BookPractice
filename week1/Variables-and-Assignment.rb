#Chapter 4 Variables and Assignments
my_string = 'You can say that again...'
puts my_string
puts my_string

name = 'anna'
puts 'my name is ' + name + '.'
puts 'wow ' + name
puts 'nice name '

composer = 'Mozart'
puts composer + 'was "da bomb" in his day.'
composer = 'Beethoven'
puts 'But I prefer ' + composer + ' personally.'

my_own_var = 'just another ' + 'string'
puts my_own_var
my_own_var = 5 * (1 + 2)
puts my_own_var

#Variables can point just about anything just not other variables
var1 = 8
var2 = var1
puts var1
puts var2
puts ''
var1 = 'eight'
puts var1
puts var2
