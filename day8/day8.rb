part = File.open("input.txt", "r")
row = 1
trees = Array.new

#Read and put files into a nested array
while !part.eof?
    line = part.readline.scan /\w/
    rowTrees = Array.new
    for i in 0..(line.length+1) do
        if i == 0 || i == line.length+1
            rowTrees.push(-1)
        else
            rowTrees.push(line[i-1].to_i)
        end
    end
    trees.push(rowTrees)
    row += 1
end

rowTrees = Array.new
for i in 0..(line.length+1) do
    rowTrees.push(-1)
end
trees.unshift(rowTrees)
trees.push(rowTrees)

visibleTrees = 0

#Part 1
(1..(trees.length-2)).each do |i|
    (1..(trees[i].length-2)).each do |j|
        visibleLeft = 1
        visibleRight = 1
        visibleTop = 1
        visibleBottom = 1

        #checking left
        (0.. j-1).each do |j2|
            if trees[i][j] <= trees[i][j2]
                visibleLeft = 0
                break
            end
        end

        #checking right
        (j+1..trees[i].length-1).each do |j2|
            if trees[i][j] <= trees[i][j2]
                visibleRight = 0
                break
            end
        end

        #checking top
        (0..i-1).each do |i2|
            if trees[i][j] <= trees[i2][j]
                visibleTop = 0
                break
            end
        end

        #checking bottom
        (i+1..trees.length-1).each do |i2|
            if trees[i][j] <= trees[i2][j]
                visibleBottom = 0
                break
            end
        end

        visibleTrees +=1 if (visibleLeft + visibleRight + visibleTop + visibleBottom > 0) 
    end
end

puts "visibleTrees is #{visibleTrees}"

#Part 2

highScore = 0
(2..(trees.length-3)).each do |i|
    (2..(trees[i].length-3)).each do |j|
        viewLeft = 0
        viewRight = 0
        viewTop = 0
        viewBottom = 0

        #checking left
        (1.. j-1).reverse_each do |j2|
            if trees[i][j] <= trees[i][j2]
                viewLeft = j-j2
                break
            end
        end
        viewLeft = j-1 if viewLeft == 0

        #checking right
        (j+1..trees[i].length-2).each do |j2|
            if trees[i][j] <= trees[i][j2]
                viewRight = j2-j
                break
            end
        end
        viewRight = trees[i].length-2-j if viewRight == 0

        #checking top
        (1..i-1).reverse_each do |i2|
            if trees[i][j] <= trees[i2][j]
                viewTop = i-i2
                break
            end
        end
        viewTop = i-1 if viewTop == 0

        #checking bottom
        (i+1..trees.length-2).each do |i2|
            if trees[i][j] <= trees[i2][j]
                viewBottom = i2-i
                break
            end
        end
        viewBottom = trees.length-2-i if viewRight == 0
        
        viewTrees = viewLeft * viewRight * viewTop * viewBottom
        puts "viewTrees is #{viewTrees}"
        highScore = viewTrees if viewTrees > highScore
    end
end

puts "highScore is #{highScore}"