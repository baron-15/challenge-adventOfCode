count1 = 0
count2 = 0
File.open("input.txt", "r").each do |line|
    elf1s = line.partition(',')[0][0..line.partition(',')[0].index('-')].to_i
    elf1e = line.partition(',')[0][line.partition(',')[0].index('-')+1..-1].to_i
    elf2s = line.partition(',')[2][0..line.partition(',')[2].index('-')].to_i
    elf2e = line.partition(',')[2][line.partition(',')[2].index('-')+1..-1].to_i
    puts "Elf1 starts at #{elf1s} and ends at #{elf1e}."
    puts "Elf2 starts at #{elf2s} and ends at #{elf2e}."

    
    if ((elf1s <= elf2s && elf1e >= elf2e) || (elf2s <= elf1s && elf2e >= elf1e))
        count1 += 1
        puts "Overlap part 1!"
    end

    if ((elf1e >= elf2s && elf1s <= elf2e) || (elf2e >= elf1s && elf2s <= elf1e))
        count2 += 1
        puts "Overlap part 2!"
    end
end

puts "Part 1 equals #{count1}."
puts "Part 2 equals #{count2}."


a = [ "a", "b", "c" ]
t = ["a", "b"]
puts "Test: #{a.include?(t) }" 