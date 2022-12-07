class Directory
    attr_accessor :parent, :name, :size
    def initialize(parent = nil, name = "", size = 0)
        @parent = parent
        @name = name
        @size = size
    end
end

d = Directory.new(nil, "/", 0)
puts "It's parent is #{d.parent}."
d = Directory.new(d, "2nd",0)
puts "It's parent is #{d.parent}."
d = Directory.new(d,"3rd",0)
puts "It's parent is #{d.parent}."