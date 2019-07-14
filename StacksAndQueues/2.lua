Stack = {}

function Stack:Create()
    local t = {}
    t._et = {}

    function t:push(...)
        if ... then 
            local targs = {...}
            for _,value in ipairs(targs) do
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
            else
                break
            end
        end
        return table.unpack(entries)
    end

    function t:min() 
        if #self._et > 0 then
            local min = self._et[1]
            for i = 1, #self._et do
                if self._et[i] < min then
                    min = self._et[i]
                end
            end
            return min
        end
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
