class Stack
    def initialize
        @data = []
    end
    def print
        puts @data
    end
    def push(value)
        @data.append value
    end
    def pop
        @data.pop
    end
    def peek
        return @data[0]
    end
    def is_empty
        return @data.length == 0
    end
    def sort
        tmp = Stack.new()
        count = 0
        size = @data.length
        
        while (count < size)
            min = nil
            parsed = 0
            while (!self.is_empty) do
                aux = self.pop
                if min == nil || aux < min 
                    min = aux
                end
                tmp.push aux
                parsed += 1
            end
            to_sort = nil
            while(parsed > 0)
                aux = tmp.pop
                if aux == min && to_sort == nil
                    to_sort = aux
                elsif aux != nil
                    self.push aux
                end
                parsed -= 1
            end
            tmp.push to_sort
            count += 1
        end

        while (!tmp.is_empty) do
            self.push tmp.pop
        end
    end
end

stack = Stack.new()
stack.push(7)
stack.push(1)
stack.push(3)
stack.push(8)
stack.push(6)
stack.push(9)
stack.sort
stack.pop
stack.print