starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)

file = File.open("input.txt", "r")
$sum = 0
$max = Array.new(3,0)

def checkMax
    if $sum > $max[0]
        $max[2] = $max[1]
        $max[1] = $max[0]
        $max[0]= $sum
    elsif $sum > $max[1]
        $max[2] = $max[1]
        $max[1] = $sum
    elsif $sum > $max[2]
        $max[2] = $sum
    end
end

while !file.eof?
    line = file.readline
    if line.strip() != ''
        $sum += line.to_i
    else
        checkMax
        $sum = 0
    end
end

checkMax

totalCal = $max[0] + $max[1] + $max[2];

puts "The top three are #{$max[0]}, #{$max[1]}, #{$max[2]}."
puts "Total calories are #{totalCal}."

ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
puts "Elapsed time = #{ending - starting} seconds"
puts `ps -o rss #{Process.pid}`.lines.last.to_i