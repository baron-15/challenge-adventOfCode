def priorityVal (lt)
    od = lt.ord
    if od >= 97
        od = od - 96
    else
        od = od - 38
    end
    return od
end

result = Array.new
File.open("input.txt").each do |line|
    line1 = line[0..line.length/2-1]
    line2 = line[line.length/2 .. -1]
    puts "Line 1 is #{line1}"
    puts "Line 2 is #{line2}"
    line1.split("").each do |letter1|
        bk = 0
        line2.split("").each do |letter2|
            if letter1 == letter2
                puts "Same letter found! #{letter1}"
                ordinal = priorityVal(letter1)
                puts "The priority of it is #{ordinal}"
                result.push(ordinal)
                bk = 1
            end
            break  if bk == 1
        end
        break if bk == 1
    end
end

puts "Part I: The sum of these are #{result.sum}."

result2 = Array.new
partII = File.open("input.txt", "r")
while !partII.eof?
    l1 = partII.readline
    l2 = partII.readline
    l3 = partII.readline
    puts "Line 1 is #{l1}"
    puts "Line 2 is #{l2}"
    puts "Line 3 is #{l3}"
    l1.split("").each do |letter1|
        bk = 0
        l2.split("").each do |letter2|
            if letter1 == letter2
                l3.split("").each do |letter3|
                    if letter1 == letter3
                        puts "Same letter found! #{letter1}"
                        ordinal = priorityVal(letter1)
                        puts "The priority of it is #{ordinal}"
                        result2.push(ordinal)
                        bk = 1
                    end
                    break  if bk == 1
                end
            end
            break  if bk == 1
        end
        break if bk == 1
    end
end
puts "Part II: The sum of these are #{result2.sum}."