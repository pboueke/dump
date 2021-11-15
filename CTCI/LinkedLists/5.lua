-- data structure constructor

local linkedList = {}

function linkedList.construct(...)
    local args = {...}
    local head = {}
    head.value = args[1]
    head.next = nil
    local curr = head
    for i=2,#args do
        linkedList.add(curr, args[i])
        curr = curr.next
    end
    return head
end

function linkedList.add(node,value)
    new = {}
    new.value = value
    new.next = nil
    node.next = new
    return new
end

function linkedList.print(node)
	local curr = node
	repeat
		print(curr.value)
		curr = curr.next
	until curr == nil
end

-- exercise

function linkedList.get_int(ll)
    local integ = ""
    curr = ll
    repeat 
        integ = tostring(curr.value) .. integ
        curr = curr.next
    until curr == nil
    print(tostring(math.tointeger(integ)))
    return math.tointeger(integ)
end

function linkedList.sum(l1, l2)
    return linkedList.get_int(l1) + linkedList.get_int(l2)
end


ll1 = linkedList.construct(7,1,6)
ll2 = linkedList.construct(5,9,2)
print(tostring(linkedList.sum(ll1,ll2)))