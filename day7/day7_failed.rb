#Saving this as my failed approach to this problem. The issue was that I did not consider the case where subfolders COULD share the same name. Using file/folder name as the index was incorrect.

class Directory
    attr_accessor :parent, :size
    def initialize(parent = nil,  size = 0)
        @parent = parent
        @size = size
    end
end

part1 = File.open("input.txt", "r")

number = 0
prt = nil
sze = 0
line = part1.readline
puts line.to_s
folder = Hash.new
allFolders = Array.new
allFiles = Array.new
d["/"]= Directory.new()
allFolders.push("/")
prt = "/"
lsbrk = 0


while !part1.eof?
    if lsbrk == 0
        line = part1.readline.split(/ /, 3)
        line[-1].strip!
        puts line.to_s
    else
        lsbrk = 0
    end

    if line[0] == "$"
        if line[1] == "cd" 
            puts "we are opening/closing a folder."
            if line[2] != ".."
                prt = line[2]
                "Entering the folder #{prt}."
            else
                puts "Exiting the folder #{prt}"
                prt = d[prt].parent
                allFolders.push(line[2]) 
                
            end
            puts "prt updated to #{line[2]}"
        else
            line = part1.readline.split(/ /, 2)
            line[-1].strip!
            puts line.to_s
            while line[0] != "$"
                if line[0] == "dir"
                    puts "we are in dir"
                    d[line[1]] = Directory.new(prt, 0)
                    allFolders.push(line[1])
                else
                    puts "we have a file, parent is #{prt}"
                    d[line[1]] = Directory.new(prt, line[0].to_i)
                    allFiles.push(line[1])
                end
                if !part1.eof?
                    line = part1.readline.split(/ /, 3)
                    line[-1].strip!
                    puts line.to_s
                end
                break if part1.eof?
            end
            lsbrk = 1
        end
    end
end
puts "All Folders:"
puts allFolders.to_s

puts "All files:"
puts allFiles.to_s

folderSize = {}
allFolders.each do |item|
    folderSize[item] = 0
end

allFiles.each do |item|
    puts "Let's look at file #{item}."
    while (d[item].parent != nil)
        puts "It's parent is #{d[item].parent}"
        puts "It's file size is #{d[item].size}"
        folderSize[d[item].parent] += d[item].size
        item = d[item].parent
    end
end

puts folderSize.to_s