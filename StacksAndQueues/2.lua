Stack = {}

function Stack:Create()
    local t = {}
    t._et = {}
    t._min = nil
    t._mins = {}

    function t:push(...)
        if ... then 
            local targs = {...}
            for _,value in ipairs(targs) do
                if self._min == nil then
                    self._min = value
                end
                if value < self._min then
                    self._min = value
                end
                table.insert( self._mins, self._min )
                table.insert( self._et, value )
            end
        end
    end

    function t:pop(num)
        local num = num or 1
        local entries = {}
        for i = 1, num do
            if #self._et ~= 0 then
                table.insert( entries, self._et[#self._et] )
                table.remove( self._et )
                table.remove (self._mins)
                self._min = self._mins[#self._mins]
            else
                break
            end
        end
        return table.unpack(entries)
    end

    -- TODO: I forgot this must be 0(1)
    function t:min() 
        return self._min
    end

    function t:size()
        return #self._et
    end

    function t:list()
        for i,v in pairs(self._et) do
            print(i, v)
        end
    end
    
    return t
end

stack = Stack:Create()
stack:push(100,77,58,96,51,47,13,99,52,73)
stack:list()
stack:pop(2)
stack:list()
print(stack:min())
stack:pop(2)
print(stack:min())