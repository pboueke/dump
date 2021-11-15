# 1
count = 1
(1..16).each do |x|
  print(x,' ')
  puts if (count % 4) == 0
  count += 1
end

(1..16).each_slice(4) { |x| puts x.join(' ') }

# 2
class Tree
    attr_accessor :children, :node_name
    def initialize(hashmap)
        key, value = hashmap.first
        @node_name = key
        @children = value.map {|k,v| Tree.new({k => v})}
    end
    def visit_all(&block)
        visit &block
        children.each {|c| c.visit_all &block}
    end
    def visit(&block)
        block.call self
    end
end

ruby_tree = Tree.new({'grandpa' => {
    'dad' => {
        'child 1' => {},
        'child 2' => {}
    },
    'uncle' => {
        'child 3' => {},
        'child 4' => {}
    }
    }})
puts
puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts
puts "Visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
puts

# 3
def find_in_file(filename, phrase) 
    count = 0
    File.readlines(filename).each do |line|
        count += 1
        if line.match(/#{phrase}/)
            puts  "#{count}: #{line}"
        end
    end
end

find_in_file('day_1.rb', 'my number')