starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)

def score(elf, you)
    select = 0
    outcome = 0
    case you
    # rock scenario
    when "X"
        select = 1
     # paper scenario
    when "Y"
        select = 2
    # scissors scenario
    when "Z"
        select = 3
    end
    # winning scenarios
    if ((elf == 'A') && (you == 'Y')) || ((elf == 'B') && (you == 'Z')) || ((elf == 'C') && (you == 'X'))
        outcome = 6
    # losing scenarios
    elsif ((elf == 'A') && (you == 'Z')) || ((elf == 'B') && (you == 'X')) || ((elf == 'C') && (you == 'Y'))
        outcome = 0
    # draw scenarios
    else
        outcome = 3
    end
    puts "Select score is: #{select}. Outcome score is: #{outcome}."
    return select + outcome
end

def altScore(elf, you)
    select = 0
    outcome = 0
    case you
    # losing scenario
    when "X"
        outcome = 0
    # draw scenario
    when "Y"
        outcome = 3
    # winning scenario
    when "Z"
        outcome = 6
    end
    # rock scenarios (tie when rock, lose when paper, win when scissor)
    if ((elf == 'A') && (you == 'Y')) || ((elf == 'B') && (you == 'X')) || ((elf == 'C') && (you == 'Z'))
        select = 1
    # paper scenarios (win when rock, tie when paper, lose when scissor)
    elsif ((elf == 'A') && (you == 'Z')) || ((elf == 'B') && (you == 'Y')) || ((elf == 'C') && (you == 'X'))
        select = 2
    # scissors scenarios
    else
        select = 3
    end
    puts "Select score is: #{select}. Outcome score is: #{outcome}."
    return select + outcome
end

totalScore = 0
totalScore2 = 0

File.open("input2.txt", "r").each do |line|
    elfChoice = line[0]
    yourChoice = line[2]
    totalScore += score(elfChoice, yourChoice)
end

puts "Part I score is: #{totalScore}."

File.open("input2.txt", "r").each do |line|
    elfChoice = line[0]
    yourChoice = line[2]
    totalScore2 += altScore(elfChoice, yourChoice)
end

puts "Part II score is: #{totalScore2}."

ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
puts "Elapsed time = #{ending - starting} seconds"
puts "Memory usage = #{`ps -o rss #{Process.pid}`.lines.last.to_i}"
