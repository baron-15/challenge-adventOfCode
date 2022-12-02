file = File.open("input.txt", "r")
sum = 0
$max = Array.new(3,0)

def checkMax($max, val)
    if val > $max[0]
        puts "New max!"
        $max[2] = $max[1]
        $max[1] = $max[0]
        a1 = sum
    elsif sum > $max[1]
        puts "New 2nd max!"
        a3 = a2
        a2 = sum
    elsif sum > $max[2]
        puts "New 3rd max!"
        a3 = sum
    end
end

while !file.eof?
    line = file.readline
    if line.strip() != ''
        sum += line.to_i
    else
        checkMax
        sum = 0
    end
end

puts "Last user... sum is #{sum}."
if sum > a1
    puts "New max!"
    a3 = a2
    a2 = a1
    a1 = sum
elsif sum > a2
    puts "New 2nd max!"
    a3 = a2
    a2 = sum
elsif sum > a3
    puts "New 3rd max!"
    a3 = sum
end

totalCal = a1 + a2 + a3;

puts "The top three are #{a1}, #{a2}, #{a3}."
puts "Total calories are #{totalCal}."