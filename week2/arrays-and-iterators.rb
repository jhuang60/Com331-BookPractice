# Chapter 8 Arrays and Iterators

puts 'Chapter 8 Arrays and Iterators---------------->'
puts ''
#Building and sorting an array
puts 'Building and sorting an array---------------->'

puts 'Enter words to sort: '
words = []
while true
  word = gets.chomp
  if word == ''
    break
  end
  words.push word
end
puts 'Here are they sorted:'
puts words.sort

puts 'Table of content revisited---------------->'

chapters = [['Getting started', 1],
           ['Numbers', 9],
           ['Letters', 13]]
puts ('Table of content'.center(50))
puts ''
chap_num = 1
chapters.each do |chap|
  name = chap[0]
  page = chap[1]
  beginning = 'Chapter ' + chap_num.to_s + ': ' + name
  ending = 'page ' + page.to_s
  puts beginning.ljust(30) + ending.rjust(20)
  chap_num = chap_num + 1
end
 
=begin
[] #empty array
[5] #array holding a single number
[ 'Hello', 'Goodbye'] #array with 2 strings
flavor = 'vanilla'  #simple assignment
[89.9, flavor, [true, false]] # array with 3 objects

names = ['Ada', 'Belle', 'Chris']
puts names
puts ' '
puts names[0]
puts names[1]
puts names[2]
# puts names[3] # This is out of range
puts '---------------->'
other_peeps = []
other_peeps [3] = 'beebee meaner'
other_peeps [0] = 'ah-ha'
other_peeps [1] = 'seedee'
other_peeps [0] = 'beebee ah-ha'
puts other_peeps

# The method each
puts 'The method each ---------------->'

languages = ['English', 'Norwegian', 'Ruby']
languages.each do |lang|
  puts 'I love ' + lang + '!'
  puts 'Don\'t you?'
end
puts 'And let\'s hear it for Java!'
puts '<crickets chirp in the distance>'

puts '---------------->'

#Go-go-gadget-integer-method...
3.times do
  puts 'Hip-hip hooray'
end
2.times do
  puts '...you can say that again...'
end

puts 'More array methods ---------------->'
foods = ['Artichoke', 'brioche', 'caramel']
puts foods
puts
puts foods.to_s
puts
puts foods.join(', ')
puts
puts foods.join(' :) ') + ' 8)'
200.times do
  puts []
end
puts '---------------->'
favorites = []
favorites.push 'raindrops on roses' #push adds an object
favorites.push 'whiskey on kittens'
puts favorites[0]
puts favorites.last #tells you which object is the last one
puts favorites.length
puts favorites.pop # pop removes the last object of the array
puts favorites
puts favorites.length
=end
