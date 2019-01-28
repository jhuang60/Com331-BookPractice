# Chapter 13 Creating new classes changing existing ones

class Integer
  def to_eng
    if self == 5
      english = 'five'
    else
      english = 'forty-two'
    end
    english
  end
end
puts 5.to_eng
puts 42.to_eng

#exercises
puts ''
puts 'Extend the built-in classes------------------>'
puts ''
class Array
  def shuffle
    arr = self
    shuf = []
    while arr.length > 0
      rand_index = rand(arr.length)
      curr_index = 0
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
end
class Integer
  def factorial
    if self <= 1
      1
    else
      self * (self-1).factorial
    end
  end
  def to_roman
    roman = ''
    roman = roman + 'M' * (self /1000)
    roman = roman + 'D' * (self % 1000 / 500)
    roman = roman + 'C' * (self % 500 /100)
    roman = roman + 'L' * (self % 100 / 50)
    roman = roman + 'X' * (self % 50 /10)
    roman = roman + 'V' * (self % 10/ 5)
    roman = roman + 'I' * (self % 5/ 1)
    roman
  end
end
puts [1,2,3,4,5].shuffle
puts 7.factorial
puts 73.to_roman

puts ''
puts 'Orange tree------------------>'
puts ''

class OrangeTree
  def initialize
    @height = 0
    @orange__count = 0
    @alive = true
  end
  def height
    if @alive
      @height
    else
      'A dead tree is not very tall'
    end
  end
  def count_the_oranges
    if @alive
      @orange__count
    else
      'A dead tree had no oranges.'
    end
  end
  def one_year_passes
    if @alive
      @height = @height + 0.4
      @orange__count = 0
      if @height > 10 && rand(2) > 0
        @alive = false
        'og, no! the tree is too old and has died'
      elsif @height > 2
        @orange__count = (height * 15 - 25).to_i
        "The tree is #{@height}m tall" +
        "and has #{@orange__count} oranges."
      else
        "The tree is #{@height}m tall," +
        "But has no oranges."
      end
    else
      'The tree is dead after a year.'
    end
  end
  def pick_an_orange
    if @alive
      if @orange__count > 0
        @orange__count = @orange__count - 1
        'You pick a good orange!'
      else
        'You pick a juicy, delicious oranges'
      end
    else
      'A dead tree has nothing to pick'
    end
  end
end
ot = OrangeTree.new
23.times do
  ot.one_year_passes
end
puts(ot.one_year_passes)
puts(ot.count_the_oranges)
puts(ot.height)
puts(ot.one_year_passes)
puts(ot.one_year_passes)
puts(ot.one_year_passes)
puts(ot.one_year_passes)
puts(ot.one_year_passes)
puts(ot.height)
puts(ot.count_the_oranges)
puts(ot.pick_an_orange)

#Creating classes
class Die
  def roll
    1 + rand(6)
  end
end
dice = [Die.new, Die.new]
dice.each do |die|
  puts die.roll
end

#Instance variable
class Die
  def roll
    @number_showing = 1 + rand(6) # @ for instance var
  end
  def showing
    @number_showing
  end
end
die = Die.new
die.roll
puts die.showing
puts die.showing
die.roll
puts die.showing
puts die.showing



class Die
  def roll
    @number_showing = 1 + rand(6) # @ for instance var
  end
  def showing
    @number_showing
  end
end
puts Die.new.showing



class Die
  def initialize
    roll
  end
  def roll
    @number_showing = 1 + rand(6)
  end
  def showing
    @number_showing
  end
end
puts Die.new.showing


#Baby dragon
class Dragon
  def initialize name
    @name = name
    @asleep = false
    @stuff_in_belly = 10
    @stuff_in_intestine = 0
    puts "#{@name} is born."
  end
  def feed
    puts "you feed #{@name}."
    @stuff_in_belly = 10
    passage_of_time
  end
  def walk
    puts "you walk #{@name}."
    @stuff_in_intestine = 0
    passage_of_time
  end
  def put_to_bed
    puts "You put #{@name} to bed."
    @asleep = true
    3.times do
      if @asleep
        passage_of_time
      end
      if @asleep
        puts "#{@name} snores, filling the room with smoke."
      end
    end
    if @asleep
      @asleep = false
      puts "#{@name} walkes up slowly."
    end
  end
  def toss
  puts "You toss #{@name} up into the air."
  puts "He giggles, which singes your eyebrows."
  passage_of_time
  end
  def rock
    puts "You rock #{@name} gently."
    @asleep = true
    puts "He briefly dozes off..."
    passage_of_time
    if @asleep
      @asleep = false
      puts "... but wake when you stop."
    end
  end
  private
  def hungry?
      @stuff_in_belly <= 2
  end
  def poopy?
      @stuff_in_intestine >= 8
  end
    def passage_of_time
      if @stuff_in_belly > 0
        @stuff_in_belly = @stuff_in_belly - 1
        @stuff_in_intestine =@stuff_in_belly + 1
      else
        if @asleep
          @asleep = false
          puts 'He wakes up suddenly!'
        end
        puts "#{@name} is starving!"
        exit
      end
      if @stuff_in_intestine >= 10
        @stuff_in_intestine = 0
        puts "Whoops! #{@name} had an accident..."
      end
      if hungry?
        if @asleep
          @asleep = false
          puts 'He suddenly wakes up!'
        end
        puts "#{ @name }'s stomach grumbles..."
      end
      if poopy?
        if @asleep
          @asleep = false
          puts 'He suddenly wakes up!'
    end
    puts "#{@name} does the potty dance..."
  end
end
end
  pet = Dragon.new 'Norbert'
  pet.feed
  pet.toss
  pet.walk
  pet.put_to_bed
  pet.rock
  pet.put_to_bed
  pet.put_to_bed
  pet.put_to_bed
  pet.put_to_bed


puts ''
puts 'Interactive baby dragon------------------>'
puts ''
puts 'Enter a name for your dragon:'

name = gets.chomp
pet = Dragon.new name
while true
  puts
  puts 'commands: feed, toss, walk, rock, put to bed, exit'
  command = gets.chomp
  if command == 'exit'
    exit
  elsif command == 'feed'
    pet.feed
  elsif command == 'toss'
    pet.toss
  elsif command == 'walk'
    pet.walk
  elsif command == 'rock'
    pet.rock
  elsif command == 'put to bed'
    pet.put_to_bed
  else
    puts 'Please type a command'
  end
end
