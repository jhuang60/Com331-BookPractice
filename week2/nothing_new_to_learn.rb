# Chapter 10 There is nothing new to learn in this chapter

#Exercise

puts 'shuffle ------------------------------>'
def shuffle arr
  shuf = []
  while arr.length > 0
    rand_index = rand(arr.length)
    curr_index = 0
    new_index = 0
    new_arr = []
    arr.each do |item|
      if curr_index == rand_index
        shuf.push item
      else
        new_arr.push item
      end
      curr_index = curr_index + 1
    end
    arr = new_arr
  end
  shuf
end
puts (shuffle([1,2,3,4,5,6,7,8,9]))

puts ''
puts 'Dictionary sort ------------------------------>'
def dictionary_sort arr
  rec_dict_sort arr, []
end
def rec_dict_sort unsorted, sorted
  if unsorted.length <= 0
    return sorted
  end
  smallest = unsorted.pop
  still_unsorted = []
  unsorted.each do |tested_object|
    if tested_object.downcase < smallest.downcase
      still_unsorted.push smallest
      smallest = tested_object
    else
      still_unsorted.push tested_object
    end
  end
  sorted.push smallest
  rec_dict_sort still_unsorted, sorted
end
puts (dictionary_sort(['can', 'feel', 'singing', 'like', 'a', 'can']))

puts ''
puts 'Expanded English_number ---------------------->'
def english_number number
  if number < 0
    return 'Please enter a non-negative number'
  end
  if number == 0
    return 'zero'
  end
  num_string = ''
  ones_place = ['one', 'two', 'three',
                'four', 'five', 'six',
                'seven', 'eight', 'nine']
  tens_place = ['ten', 'twenty', 'thirty',
                'fourty', 'fifty', 'sixty',
                'seventy', 'eighty', 'ninety']
  teenagers = ['eleven', 'twelve','thirteen',
                'fourteen', 'fifteen', 'sixteen',
              'seventeen', 'eighteen', 'nineteen']
  zillions = [['hundred', 2],
             ['thousand', 3],
             ['million', 6],
             ['billion', 9],
             ['trillion', 12],
             ['quadrillion', 15],
             ['quintillion', 18],
             ['sextillion', 21],
             ['septtillion', 24],
             ['octillion', 27],
             ['nonillion', 30],
             ['decillion', 33],
             ['undecillion', 36],
             ['duodecillion', 39],
             ['tredecillion', 42],
             ['quattuordecillion', 45],
             ['quindecillion', 48],
             ['sexdecillion', 51],
             ['septendecillion', 54],
             ['octodecillion', 57],
             ['novemdecillion', 60],
             ['vigintillion', 63],
             ['googol', 100]]
  left = number
  while zillions.length > 0
    zil_pair = zillions.pop
    zil_name = zil_pair[0]
    zil_base = 10 ** zil_pair[1]
    write = left/zil_base
    left = left - write*zil_base
    if write > 0
      prefix = english_number write
      num_string = num_string + prefix + ' ' + zil_name
      if left > 0
        num_string = num_string + ' '
      end
    end
  end
  write = left/10
  left = left - write*10
  if write > 0
    if ((write == 1) and (left > 0))
      num_string = num_string + teenagers[left-1]
      left = 0
    else
      num_string = num_string + tens_place[write-1]
    end
    if left > 0
      num_string = num_string + '-'
    end
  end
  write =left
  left = 0
  if write >0
    num_string = num_string + ones_place[write-1]
  end
  num_string
end
puts english_number( 0)
puts english_number( 9)
puts english_number( 10)
puts english_number( 11)
puts english_number( 17)
puts english_number( 32)
puts english_number( 88)
puts english_number( 99)
puts english_number(100)
puts english_number(101)
puts english_number(234)
puts english_number(3211)
puts english_number(999999)
puts english_number(1000000000000)
puts english_number(28749041247676473648169346891376767361937)

puts ''
puts 'Ninety-nine bottles of beer on the wall ------>'
num_at_start = 5
num_now = num_at_start
while num_now > 2
  puts english_number(num_now).capitalize + ' bootles of beer on the wall, ' +
       english_number(num_now) + ' bottles of beer!'
  num_now = num_now - 1
  puts 'Take one down, pass it around, ' +
       english_number(num_now) + ' bottles of beer on the wall!'
end
puts "Two bottles of beer on the wall, five bottles of beer!"
puts "Take one down, pass it around, one bottles of beer on the wall!"
puts "One bottle of beer on the wall, one bottle of beer"
puts "Take one down, pass it around, no more bottles of beer on the wall!"




=begin
#recursion
puts 'recursion -------------------------------->'

def ask_recursively question
  puts question
  reply = gets.chomp.downcase
  if reply == 'yes'
    true
  elsif reply == 'no'
    false
  else
    puts 'please answer yes or no '
    ask_recursively question #this is the magic line
  end
end
ask_recursively 'Do you wet the bed? '


def factorial num
  if num < 0
    return 'You can\'t take the factorial of a negative number! '
  end
  if num <= 1
    1
  else
    num * factorial(num-1)
  end
end
puts factorial(3)
puts factorial(30)

#these are just to make the map easier for me to read
# "M " is visually more dense than "o"
M = 'land'
O = 'water'
world= [ [O,O,O,O,O,O,O,O,O,O,O],
         [O,O,O,O,M,M,O,O,O,O,O],
         [O,O,O,O,O,O,O,O,M,M,O],
         [O,O,O,M,O,O,O,O,O,M,O],
         [O,O,O,M,O,M,M,O,O,O,O],
         [O,O,O,O,M,M,M,M,O,O,O],
         [O,O,O,M,M,M,M,M,M,M,O],
         [O,O,O,M,M,O,M,M,M,O,O],
         [O,O,O,O,O,O,M,M,O,O,O],
         [O,M,O,O,O,M,O,O,O,O,O],
         [O,O,O,O,O,O,O,O,O,O,O]]
def continent_size world, x, y
  if world[y][x] != 'land'
    return 0
  end
  size = 1
  world[y][x] = 'counted land'
  size = size + continent_size(world, x-1, y-1)
  size = size + continent_size(world, x, y-1)
  size = size + continent_size(world, x+1, y-1)
  size = size + continent_size(world, x-1, y)
  size = size + continent_size(world, x+1, y)
  size = size + continent_size(world, x-1, y+1)
  size = size + continent_size(world, x, y+1)
  size = size + continent_size(world, x+1, y+1)
  size
end
puts continent_size(world, 5, 5)

puts 'Rite of passage: sorting -------------------------------->'
def sort some_array
  recursive_sort some_array, []
end
def recursive_sort unsorted_array, sorted_array
  #code goes here
end
=end
