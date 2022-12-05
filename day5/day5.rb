# Part I
ship = Array.new(10){Array.new}

part1 = File.open("input.txt", "r")
line = part1.readline
while (line.strip() != '' && line.count("a-zA-Z") > 0)
    for a in 1..9 do
        ship[a].push(line[a*4-3]) if line[a*4-3] != " "
    end
    line = part1.readline
end

ship1 = ship
while !part1.eof?
    step = part1.readline
    splitWords = ["move "," from ", " to ", "\n"]
    stepArray = step.split(Regexp.union(splitWords)).reject{|c| c.empty?}
    move1 = stepArray[0].to_i
    from2 = stepArray[1].to_i
    to3 = stepArray[2].to_i
    for m in 1..move1 do
        ship1[to3].unshift(ship1[from2].shift)
    end
end

puts "Part I result:"
ship.each {|x| puts x.to_s}
part1.close

# Part II
ship2 = ship

while !part2.eof?
    step = part2.readline
    splitWords = ["move "," from ", " to ", "\n"]
    stepArray = step.split(Regexp.union(splitWords)).reject{|c| c.empty?}
    move1 = stepArray[0].to_i
    from2 = stepArray[1].to_i
    to3 = stepArray[2].to_i
    container = Array.new
    for m in 1..move1 do
        container.push(ship2[from2].shift)
    end
    for m in 1..move1 do
        ship2[to3].unshift(container.pop)
    end
end

puts "Part II result:"
ship2.each {|x| puts x.to_s}
part2.close