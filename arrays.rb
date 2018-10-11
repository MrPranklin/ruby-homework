name = 'Stef'
age = '56'

array = [name, age, 3.14, "And his name is: #{name}", 3 + 3]

array << "anything"

puts array.inspect

size = array.count

i = 0
while i < size do
  puts "array[#{i}] = #{array[i]}"
  puts "array[#{-i}] = #{array[-i]}"    #prints values from the back
  i += 1
end
