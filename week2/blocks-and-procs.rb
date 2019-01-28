# Chapter 14 blocks and procs

toast = Proc.new do
  puts 'Cheers!'
end
toast.call
toast.call
toast.call

puts '----------------->'
do_you_like = Proc.new do |good_stuff|
  puts "I *really* like #{good_stuff}!"
end
do_you_like.call 'chocolate'
do_you_like.call 'ruby'

puts '----------------->'
#Methods that take procs
def do_self_importanly some_proc
  puts "everybody just hold on!"
  some_proc.call
  puts "ok everyone."
end
say_hello = Proc.new do
  puts 'hello'
end
say_goodbye = Proc.new do
  puts 'goodbye'
end
do_self_importanly say_hello
do_self_importanly say_goodbye

puts '----------------->'

def maybe_do some_proc
  if rand(2) == 0
    some_proc.call
  end
end
def twice_do some_proc
  some_proc.call
  some_proc.call
end
wink = Proc.new do
  puts '<wink>'
end
glance = Proc.new do
  puts '<glance>'
end
maybe_do wink
maybe_do wink
maybe_do glance
maybe_do glance
twice_do wink
twice_do glance

puts '----------------->'
def do_until_false first_input, some_proc
  input = first_input
  output = first_input
  while output
    input = output
    output = some_proc.call input
  end
  input
end
build_array_of_squares = Proc.new do |array|
  last_number = array.last
  if last_number <= 0
    false
  else
    array.pop
    array.push last_number*last_number
    array.push last_number-1
  end
end
always_false = Proc.new do |just_ignore_me|
  false
end
puts do_until_false([5], build_array_of_squares).inspect
yum = 'lemonade with a hint of orange blosso water'
puts do_until_false(yum, always_false)

puts 'Methods that return procs----------------->'
def compose proc1, proc2
  Proc.new do |x|
    proc2.call(proc1.call(x))
  end
end
square_it = Proc.new do |x|
  x*x
end
double_it = Proc.new do |x|
  x+x
end
double_then_square = compose double_it, square_it
square_then_double = compose square_it, double_it
puts double_then_square.call(5)
puts square_then_double.call(5)

puts 'Passing Blocks(Not procs) into methods-------->'
class Array
  def each_even(&was_a_block__now_a_proc)
    is_even = true
    self.each do |object|
      if is_even
        was_a_block__now_a_proc.call object
      end
      is_even = !is_even
    end
  end
end
fruits =['apple', 'bad apple', 'cherry', 'durian']
fruits.each_even do |fruit|
  puts "Yum! i just love #{fruit} pies, don't you?"
end
[1,2,3,4,5].each_even do |odd_ball|
  puts "#{odd_ball} is NOT an even number"
end

puts '--------------------------->'
def profile block_description, &block
  start_time = Time.new
  block.call
  duration = Time.new - start_time
  puts "#{block_description}: #{duration} seconds}"
end
profile '25000 doublings' do
  number = 1
  25000.times do
    number= number +number
  end
  puts "#{number.to_s.length} digits"
end
profile 'count to a million' do
  number = 0
  1000000.times do
    number = number + 1
  end
end
puts ''
puts 'Even better profiling---------->'
puts ''
def profile block_description, &block
  profiling_on = false
  if profiling_on
    start_time = Time.new
    block.call
    duration = Time.new - start_time
    puts '#{block_description}: #{duration} seconds'
  else
    block.call
  end
end

puts ''
puts 'Grandfather clock---------->'
puts ''
def grandfather_clock &block
  hour = Time.new.hour
  if hour >= 13
    hour = hour - 12
  end
  if hour == 0
    hour = 12
  end
  hour.times do
    block.call
  end
end
grandfather_clock do
  puts 'DOING!'
end

puts ''
puts 'Program logger---------->'
puts ''
def log desc, &block
  puts 'Begining "' + desc + '"...'
  result = block.call
  puts '..."'+ desc + '"finished, returning:' + result.to_s
  end
  log 'outer block' do
    log 'some little block' do
      1**1 + 2**2
    end
    log 'yet another block' do
      '! doof iahT ekil I '.reverse
  end
  '0' == '0'
end


puts ''
puts 'better program logger---------->'
puts ''
$logger_depth = 0
def log desc, &block
  prefix = ' '*$logger_depth
  puts prefix+ 'Begining "' + desc + '"...'
  $logger_depth = $logger_depth + 1
  result = block.call
  $logger_depth = $logger_depth - 1
  puts prefix + '..."'+ desc + '"finished, returning:' + result.to_s
end
log 'outer block' do
  log 'some lttle block' do
    log 'teeny-tiny block' do
      'lots of love'.downcase
    end
    7*3*2
  end
  log 'yet another block' do
    '!doof naidnI evoL I'.reverse
  end
  '0' == '0'
end
