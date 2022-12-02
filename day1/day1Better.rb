starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)

puts ("The sum of top 3 elves carrying the most calories is #{IO.readlines("input.txt", chomp: true).slice_when { |a,b| (a.empty?) ^ (b.empty?) }.to_a.map{ |n| n.map(&:to_i).sum }.reject(&:nil?).sort.last(3).sum}.") 

ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
puts "Elapsed time = #{ending - starting} seconds"
require "os"
puts `ps -o rss #{Process.pid}`.lines.last.to_i