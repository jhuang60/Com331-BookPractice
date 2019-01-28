# Chapter 12 new classes of objects

alpha = Array.new + [12345]
beta = String.new + 'hello'
karma = Time.new
puts "alpha = #{alpha}"
puts "beta = #{beta}"
puts "karma = #{karma}"

#The time class
time = Time.new
time2 = time + 60 #oNE MINUTE LATER
puts time
puts time2

puts Time.local(2000,1,1)
puts Time.local(1976,8,3,13,31)

puts Time.gm(1955,11,5)

#Exercise
puts ' '
puts 'One Billion Seconds------------------>'
puts ' '
puts(Time.gm(1976, 8, 3, 13, 31) + 10**9)


puts ' '
puts 'Happy Birthday------------------>'
puts ' '
puts 'What year were you born?'
year = gets.chomp.to_i
puts 'What month were you born? enter numbers from 1-12'
month = gets.chomp.to_i
puts 'What day were you born?'
day = gets.chomp.to_i
bd = Time.gm(year, month, day)
time = Time.new
age = 1
while Time.local(year+age, month, day) <= time
  puts "SPANK! Age = #{age}"
  age = age + 1
end

#Hash
dict_array = []
dict_hash = {}
dict_array[0] = 'candle'
dict_array[1] = 'glasses'
dict_array[2] = 'truck'
dict_array[3] = 'alicia'
dict_hash['shia-a'] ='candle'
dict_hash['shaya'] = 'glasses'
dict_hash['shasha'] = 'truck'
dict_hash['sh-sha'] = 'alicia'
dict_array.each do |word|
  puts word
end
dict_hash.each do |c_word, word|
  puts "#{c_word}: #{word}"
end

weird_hash = Hash.new
weird_hash[12] = 'monkeys'
weird_hash[[]] = 'emptiness'
weird_hash[Time.new] = 'no time like this present'

#Rages
letters = 'a'..'c'
puts(['a', 'b', 'c'] == letters.to_a) #convert range to array
('A'..'Z').each do |letter|
  print letter
end
puts
god_bless_the_70s = 1970..1979
puts god_bless_the_70s.min
puts god_bless_the_70s.max
puts (god_bless_the_70s.include?(1979))
puts (god_bless_the_70s.include?(1980))
puts (god_bless_the_70s.include?(1974.5))

#Stringy Superpowers
da_man = 'Mr. T'
big_T = da_man[4]
puts big_T

puts "Hello. my name is julian."
puts "i'm extremely perceptive."
puts "what's your name?"
name = gets.chomp
puts "Hi, #{name}."
if name[0] == 'c'
  puts 'you have excellent taste in footwear.'
  puts 'i can just tell.'
end

puts ' '
prof = 'we tore the universe a new space-hole, alright!'
puts prof[12,8]
puts prof[12..19]
puts
def is_avi? filename
  filename.downcase[-4..-1] == '.avi'
end
puts is_avi?('dancemonkeyboy.avi')
puts is_avi?('toilet.jpg')

puts(42.class)
puts("I'll have mayonnaise on mine!".class)
puts(Time.new.class)
puts(Time.class)
puts(String.class)
puts(Class.class)

#Exercise
puts ' '
puts 'Party like it\'s roman_to_integer------------------>'
puts ' '
def roman_to_integer roman
  digit_vals = {'i' => 1,
                'v' => 5,
                'x' => 10,
                'l' => 50,
                'c' => 100,
                'd' => 500,
                'm' => 1000
              }
  total = 0
  prev = 0
  index = roman.length - 1
  while index >= 0
    c = roman[index].downcase
    index = index -1
    val = digit_vals[c]
    if !val
      puts 'This is not a valid roman numeral!'
      return
    end
    if val < prev
      val = val * -1
    else
      prev = val
    end
    total = total + val
  end
  total
end
puts(roman_to_integer('mcmxcix'))
puts(roman_to_integer('CCCLXV'))


puts ' '
puts 'Birthday helper------------------>'
puts ' '
birth_dates = {}
File.read('birthdates.txt').each_line do |line|
    line = line.chomp
    first_comma = 0
  while line[first_comma] != ',' &&
    first_comma < line.length
    first_comma = first_comma + 1
  end
  name = line[0..(first_comma - 1)]
  date = line[-12..-1]
  birth_dates[name] = date
end
puts 'Whose birthday would you like to know?'
name = gets.chomp
date = birth_dates[name]
if date == nil
  puts "I do not know that one "
else
  puts date[0...5]
end
