starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)

sum = 0
sumArr = Array.new
File.open("input.txt", "r").each do |line|
    if line.strip() != ''
        sum += line.to_i
    else
        sumArr.push(sum)
        sum = 0
    end
end
sumArr.sort!
puts "The max three are #{sumArr[-1]}, #{sumArr[-2]} and #{sumArr[-3]}. The total is #{sumArr[-1] + sumArr[-2] + sumArr[-3]}."

ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
puts "Elapsed time = #{ending - starting} seconds"
puts "Memory usage = #{`ps -o rss #{Process.pid}`.lines.last.to_i}"