class Node
    attr_accessor :value, :next
    def initialize(value, next_node)
        @value = value
        @next = next_node
    end
end

class LinkedList
    attr_accessor :head
    def initialize()
        @head = nil
    end
    def print() 
        curr = @head
        counter = 0
        while (curr != nil)
            puts curr.value
            curr = curr.next
            counter += 1
            if counter > 50
                break
            end
        end
    end
    def collide()
        fast = @head
        slow = @head
        fast_counter = 0
        slow_counter = 0
        while fast != nil && slow != nil
            fast = fast.next
            if fast != nil
                fast = fast.next
                slow = slow.next
            end
            if fast == slow
                break
            end
        end
        if fast == nil 
            return nil
        end

        slow = @head
        
        while slow != fast
            slow = slow.next
            fast = fast.next
        end

        return slow.value
    end
end

ll = LinkedList.new()
cycle_node = Node.new(5,nil)
node = Node.new(10, cycle_node)
new_node = Node.new(9,node)
new_node = Node.new(8,new_node)
new_node = Node.new(7,new_node)
new_node = Node.new(6,new_node)
seq_node = Node.new(4,new_node)
new_node = Node.new(3,seq_node)
new_node = Node.new(2,new_node)
new_node = Node.new(1,new_node)
new_node = Node.new(0,new_node)
new_node = Node.new(0,new_node)
new_node = Node.new(0,new_node)
cycle_node.next = seq_node

ll.head = new_node
ll.print
puts
puts ll.collide
