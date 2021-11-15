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
        while (curr != nil)
            puts curr.value
            curr = curr.next
        end
    end
    def add_tail(value)
        if @head == nil
            @head = Node.new(value, nil)
        else
            curr = @head
            while(curr.next != nil)
                curr = curr.next
            end
            curr.next = Node.new(value, nil)
        end
    end
    def partition(part)
        lt_ll = LinkedList.new()
        gt_ll = LinkedList.new()
        curr = @head
        while(curr != nil)
            if curr.value < part
                lt_ll.add_tail(curr.value)
            else
                gt_ll.add_tail(curr.value)
            end
            curr = curr.next
        end
        curr = lt_ll.head
        if curr == nil
            return gt_ll
        end
        while(curr.next != nil)
            curr = curr.next
        end
        curr.next = gt_ll.head
        return lt_ll
    end
end

ll = LinkedList.new()
ll.add_tail(5)
ll.add_tail(2)
ll.add_tail(7)
ll.add_tail(9)
ll.add_tail(1)
ll.add_tail(6)
ll.add_tail(3)
ll.add_tail(8)
ll.add_tail(4)
ll.add_tail(10)
ll.print
puts
ll.partition(5).print()
