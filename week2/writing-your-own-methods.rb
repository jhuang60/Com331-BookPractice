# Chapter 9 writing your own methods

#Exercises
#Improved ask method
puts 'Improved ask method ---------->'
def ask question
  while true
    puts question
    reply = gets.chomp.downcase
    if reply == 'yes'
      return true
    end
    if reply == 'no'
      return false
    end
  end
end
likes_it = ask 'do you like eating tacos?'
puts likes_it



puts ''
puts 'Old-school roman numerals ---------->'
def old_roman_numeral num
  roman = ''
  roman = roman + 'M' * (num/1000)
  roman = roman + 'D' * (num % 1000 / 500)
  roman = roman + 'C' * (num % 500 / 100)
  roman = roman + 'L' * (num % 100 / 50)
  roman = roman + 'X' * (num % 50 / 10)
  roman = roman + 'V' * (num % 10 / 5)
  roman = roman + 'I' * (num % 5 / 1)
end
puts 'enter a number between 1 to 3000'
num1 = gets.chomp
puts(old_roman_numeral(num1.to_i))



puts ''
puts 'modern roman numerals ---------->'
def roman_numeral num
  thous = (num/ 1000)
  hunds = (num % 1000 / 100)
  tens = (num % 100 / 10)
  ones = (num % 10)
  roman = 'M' * thous
  if hunds == 9
    roman = roman + 'CM'
  elsif hunds == 4
    roman = roman + 'CD'
  else
    roman = roman + 'D' * (num % 1000 / 500)
    roman = roman + 'C' * (num % 500 / 100)
  end
  if tens == 9
    roman = roman + 'XC'
  elsif tens == 4
    roman = roman + 'XL'
  else
    roman = roman + 'L' * (num % 100 / 50)
    roman = roman + 'X' * (num % 50 / 10)
  end
  if ones == 9
    roman = roman + 'IX'
  elsif ones == 4
    roman = roman +'IV'
  else
    roman = roman + 'V' * (num % 10/5)
    roman = roman + 'I' * (num % 5/1)
  end
  roman
end
puts 'enter a number between 1 to 3000'
num1 = gets.chomp
puts(roman_numeral(num1.to_i))
puts ''


=begin
def say_moo
  puts 'moooooooo...'
end

say_moo
say_moo
puts 'coin-coin '
say_moo
say_moo

# Methods parameters
puts 'Methods parameters ---------->'

def say_moo number_of_moos
  puts 'mooooo...' * number_of_moos
end
say_moo 3
puts 'oink-oink'
# say_moo #error for missing parameter

puts 'Local Variables ---------->'
def double_this num
  num_times_2 = num*2
  puts num.to_s + ' doubled is ' +num_times_2.to_s
end
double_this 44

puts ''

tough_var = 'You can\'t even touch my variable!'
def little_pest tough_var
  tough_var = nil
  puts 'HAHA! I ruined your variable!'
end
little_pest tough_var
puts tough_var

puts 'Experiment: Duty ---------->'
def square x
  puts(x * x)
end
x = 5
square x
my_number = 5
square my_number
x = 10
my_number = x / 2
square my_number

puts 'Return values ---------->'
return_val = 'This puts returned:'
puts return_val

def say_moo number_of_moos
  puts 'moooooo...' * number_of_moos
  'yellow submatine'
end
x= say_moo 3
puts x.capitalize + ', dude ...'
puts x + '.'

def favorite_food name
  if name == 'Lister'
    return 'Dandan mian'
  end
  if name == 'Rimmer'
    return 'char siu fan'
  end
  'hard to say ... maybe fried rice?'
end
def favorite_drink name
  if name == 'Jean-Luc'
    'original bubble tea, 25\% sugar, no ice'
  elsif name == 'Kathryn'
    'yakult, frozen'
  else
    'Perhaps... jasmine float?'
  end
end
puts '-----'
puts favorite_food('Rimmer')
puts favorite_food('Lister')
puts favorite_food('Cher')
puts favorite_drink('Kathryn')
puts favorite_drink('Oprah')
puts favorite_drink('Jean-Luc')

puts '---------->'
def ask question
  while true
    puts question
    reply = gets.chomp.downcase
    if ( reply == 'yes' || reply == 'no')
      if reply == 'yes'
        answer = true
      else
        answer = false
      end
      break
    else
      puts 'please answer "yes" or "no".'
    end
  end
  answer #this is what we return (true or false)
end
puts 'Hello, and thank you for...'
puts
ask 'Do you like eating tacos?' #ignore this return value
ask 'Do you like eating burritos?' # and this one
wets_bed = ask 'Do you wet the bed?' #save this return value
ask 'Do you like eating chimichangas?'
ask 'Do you like eating sopapillas?'
puts 'Just a few more questions...'
ask 'Do you like drinking horchata?'
ask 'Do you like eating flautas?'
puts
puts 'DEBRIEFING'
puts 'Thank you for...'
puts
puts wets_bed
=end
