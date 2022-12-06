def distinct(num)
    str = File.open("input.txt", "r").readline.scan /\w/
    for i in 0..str.length-num do
        for j in 0..num-2 do
            for k in 1..num-1 do
                if j != k
                    if str[i+j] == str[i+k]
                        bk = 1
                    end
                end
            end
        end
        break if bk != 1
        bk = 0
    end
    puts "Character found! For #{num} distinct characters, the marker is at #{i+num}."
end

distinct(4)
distinct(14)


def distinct2(num)
    newArr = Array.new
    str = File.open("input.txt", "r").readline.scan /\w/
    for i in 0..str.length-num do
        newArr[i] = Array.new
        for k in 0..num-1 do
            newArr[i].push(str[i+k])
        end
        if newArr[i].uniq.length == newArr[i].length
            puts "Character found! For #{num} distinct characters, the marker is at #{i+num}."
            bk = 1
        end
        break if bk == 1
    end
end

distinct2(4)
distinct2(14)
