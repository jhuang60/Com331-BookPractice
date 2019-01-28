# Chapter 11 reading and writing, saving and loading, yin and ...
# something else


# Doing something
# the filename doesn't have to end
# with ".txt", but since it is valid
# text, why not?
filename = 'ListerQuote.txt'
test_string = 'I primise that I swear absolutely that ' +
              'I will never mention gazpacho soup again.'
# The 'w' here is for write-access to the file,
# since we are trying to write to it.
File.open filename, 'w' do |f|
  f.write test_string
end
read_string = File.read filename
puts(read_string == test_string)

puts ' '
puts 'YAML -------------------------------->'

require 'yaml'
test_array = ['Give',
              'Mutants out!',
              'Chameleonic' ]
test_string = test_array.to_yaml
filename = 'RimmerTShirt.txt'
File.open filename, 'w' do |f|
  f.write test_string
end
read_string = File.read filename
read_array = YAML::load read_string
puts(read_string == test_string)
puts(read_string == test_string)

puts ' '
puts 'Diversion: Double-Quoted String ---------->'

buffy_quote_1 = '\'kiss rocks\'?
                why would anyone want to kiss...
                oh, wait. I get it.'
buffy_quote_2 = "'Kiss rocks'?\n" + "Why would anyone want to kiss...\n" +
                "oh, wait. I get it."
puts buffy_quote_1
puts
puts(buffy_quote_1 == buffy_quote_2)
puts ' '

puts "3...\n2...\n1...\nHappy New Year!" #but doesn't work with single quotes

require 'yaml'
def yaml_save object, filename
  File.open filename, 'w' do |f|
  f.write(object.to_yaml)
end
end
def yaml_load filename
  yaml_string = File.read filename
  YAML::load yaml_string
end
test_array = ['Slick Shoes',
              'Bully Blinders',
              'Pinchers of Peril']
filename = 'DatasGadgets.txt'
yaml_save test_array, filename
read_array = yaml_load filename
puts(read_array == test_array)


#exercises

puts 'Safe picture downloading ------------------>'
puts ' '
require 'win32ole'
STDOUT.sync = true
Thread.abort_on_exception = true
Dir.chdir 'C:\Documents and Settings\Chris\Desktop\Pictureinbox'
pic_names = Dir['!undated/**/*.{jpg,avi}']
thm_names = Dir['!undated/**/*.{thm}']
WIN32OLE.new("Scripting.FileSystemObject").Drives.each() do |x|
  if x.DriveType == 1 && x.IsReady
    pic_names += Dir[x.DriveLetter+ ':/**/*.{jpg,avi}']
    thm_names += Dir[x.DriveLetter+ ':/**/*.{thm}']
  end
end
months = %w(jan feb mar apr may jun jul aug sep oct nov dec)
encountered_error = false
print "Downloading #{pic_names.size} files: "
pic_names.each do |name|
  print '.'
  is_movie = (name[-3..-1].downcase == 'avi')
  if is_movie
    orientation = 0
    new_name = File.open(name) do |f|
      f.seek(0x144, IO:: SEEK_SET)
      f.read(20)
    end
    new_name[0...3] = '%.2d' % (1 +months.index(new_name[0...3].downcase))
    new_name = new_name[-4..-1] + ' ' + new_name[0...-5]
  else
    new_name, orientation = File.open(name) do |f|
      f.seek(0x36, IO::SEEK_SET)
      orientation_ = f.read(1)[0]
      f.seek(0xbc, IO::SEEK_SET)
      new_name_ = f.read(19)
      [new_name_, orientation]
    end
  end
  [4,7,10,13,16].each {|n| new_name[n] = '.'}
  if new_name[0] != '2'[0]
    encountered_error = true
    puts "\n" + 'Error: could not process "' + name +
    '"because it\'s not in the proper format!'
    next
  end
  save_name = new_name + (is_movie ? '.orig.avi' : '.jpg')
  while FileText.exist? save_name
    new_name += 'a'
    save_name = new_name + (is_movie ? '.orig.avi' : '.jpg')
  end
  case orientation
  when 6
    `convert "#{name}" -rotate "90>" "#{save_name}"`
    File.delete name
  when 8
    `convert "#{name}" -rotate "-90>" "#{save_name}"`
    File.delete name
  else
    File.rename name, save_name
  end
end
print "\nDeleting #{thm_names.size} THM files: "
thm_names.each do |name|
  print '.'
  File.delete name
end
if encountered_error
  puts
  puts "Press [Enter] to finish."
  puts
  puts
  gets
end


puts ' '
puts 'Build your own playlist ------------------>'
puts ' '
all_oggs = shuffle(Dir['**/*.ogg'])
File.open 'Playlist.m3u', 'w' do |f|
  all_oggs.each do |ogg|
    f.write ogg+"\n"
  end
end
puts 'Done!'


puts ' '
puts 'Build a better playlist ------------------>'
puts ' '
def music_shuffle filenames
  filenames = filenames.sort
       len  = filenames.length
2.times do
  l_idx = 0
  r_idx = len/2
  shuf = []
  while shuf.length < len
    if shuf.length%2 == 0
      shuf.push(filenames[r_idx])
      r_idx = r_idx + 1
    else
      shuf.push(filenames[l_idx])
      l_idx = l_idx + 1
    end
  end
  filenames = shuf
end
arr =[]
cut = rand(len)
idx = 0
while idx < length
  arr.push(filenames[(idx_cut)%len])
  idx = idx + 1
end
arr
end
songs = ['aa/bbb', 'aa/ccc', 'aa/ddd', 'aaa/xxxx', 'aaa/yyyy',
          'foo/bar']
puts(music_shuffle(songs))
