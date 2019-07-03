class Node:
    def __init__(self, data):
        self.next = None
        self.data = data


class LinkedList:
    def __init__(self):
        self.head = None

    def pop_at(self, pos):
        previous = None
        item = self.head

        counter = 0
        while counter < pos and item != None:
            previous = item
            item = item.next
            counter += 1

        if item != None:
            if counter == 0:
                self.head = item.next
            else:
                previous.next = item.next

        return item

    def pop_value(self, value):
        previous = None
        item = self.head

        counter = 0
        while item != None and item.data != value:
            previous = item
            item = item.next
            counter += 1

        if item != None:    
            if counter == 0:
                self.head = item.next
            else:
                previous.next = item.next
        
        return item

    def add_tail(self, value):
        new = Node(value)
        previous = self.head
        item = self.head

        while item != None:
            previous = item
            item = item.next

        if self.head == None:
            self.head = new
        else:
            previous.next = new

    def prt(self):
        item = self.head
        while item != None:
            print (item.data)
            item = item.next

    def dedup_v1(self):
        to_be_removed = []
        seen = set()
        item = self.head

        while item != None:
            if item.data in seen:
                to_be_removed.append(item.data)
            else:
                seen.add(item.data)
            item = item.next

        for value in to_be_removed:
            self.pop_value(value)

    def dedup_v2(self):
        it1 = self.head
        counter1 = 0
        while it1 != None:
            next = it1.next
            it2 = next
            counter2 = 0
            while it2 != None:
                if it1.data == it2.data and counter1 != counter2:
                    self.pop_value(it1.data)
                it2 = it2.next
                counter2 += 1
            it1 = next
            counter1 += 1

            
ll1 = LinkedList()
ll1.add_tail(1)
ll1.add_tail(7)
ll1.add_tail(100)
ll1.add_tail(3)
ll1.add_tail(8)
ll1.add_tail(7)
ll1.add_tail(2)
ll1.add_tail(9)
ll1.add_tail(2)
ll1.pop_at(0)
ll1.pop_value(100)
ll1.prt()

print("\n Deduped (v1):")
ll1.dedup_v1()
ll1.prt()

ll2 = LinkedList()
ll2.add_tail(1)
ll2.add_tail(7)
ll2.add_tail(100)
ll2.add_tail(3)
ll2.add_tail(8)
ll2.add_tail(7)
ll2.add_tail(2)
ll2.add_tail(9)
ll2.add_tail(2)
ll2.pop_at(0)
ll2.pop_value(100)

print("\n Deduped (v2):")
ll2.dedup_v2()
ll2.prt()