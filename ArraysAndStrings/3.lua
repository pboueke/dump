-- O(N)
function URLify(string)
    local new_string = ""
    for i = 1,#string do
        local c = string:sub(i,i)
        if c == " " then
            new_string = new_string .. "%20"
        else
            new_string = new_string .. c
        end
    end 
    return new_string
end

print(URLify("urlify this string"))