-- 1.
function concatenate(a1, a2)
    for i = 1,#a2 do
        a1[#a1 + i] = a2[i]
    end
    return a1
end

a1 = {1,2,3,4}
a2 = {5,6,7,8}
print("Cocatenated array length:")
print(#concatenate(a1,a2))

-- 2. strict.lua

-- 3.
mt = {
    __add = concatenate
}

setmetatable(_G, {
    __newindex = function(t, k, v)
        if type(v) == 'table' then
            setmetatable(v, { __add = concatenate })
        end
        rawset(t, k, v)
    end
})

a3 = {1,2,3,4}
a4 = {5,6,7,8}
print(#(a3+a4))
print()

-- 4.

local Queue = {items = {}}
Queue.__index = Queue

function Queue.new ()
    local self = setmetatable({}, Queue)
    self.items = {}
    return self
end

function Queue:add(item)
    return table.insert(self.items, item)
end

function Queue:remove()
    return table.remove(self.items, 1)
end

local q = Queue:new()
q:add(1)
q:remove()

-- 5. retry.lua