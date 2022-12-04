count1 = 0
count2 = 0
File.open("input.txt", "r").each do |line|
    elf1 = line.partition(',')[0]
    elf2 = line.partition(',')[2]
    elf1s = elf1[0..elf1.index('-')].to_i
    elf1e = elf1[elf1.index('-')+1..-1].to_i
    elf2s = elf2[0..elf2.index('-')].to_i
    elf2e = elf2[elf2.index('-')+1..-1].to_i
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

# My regular method compared the beginning and end dates for two elves.
# My four-line method created an array of all integers between two numbers for each elf (array a and b), then used (1) a-b's length vs a's length - b's length, vice versa and (2) a-b's length vs a's length to decide if a complete or partial overlap existed