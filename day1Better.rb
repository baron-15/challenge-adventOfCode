puts ("The sum of top 3 elves carrying the most calories is #{IO.readlines("input.txt", chomp: true).slice_when { |a,b| (a.empty?) ^ (b.empty?) }.to_a.map{ |inner_array| inner_array.map(&:to_i).inject(&:+) }.reject(&:nil?).sort!.reverse.first(3).inject(0, :+)}.") 

#Did it in one line