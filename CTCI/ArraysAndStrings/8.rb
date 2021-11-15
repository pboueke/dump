matrix = [[1,2,3,0],[1,2,3,4],[1,0,3,4],[1,2,3,4]]
zero_cols = []
zero_rows = []

for i in 0..(matrix.length - 1)
    for j in 0..(matrix[i].length - 1)
        if matrix[i][j] == 0 
            zero_rows.insert(0,i)
            zero_cols.insert(0,j)
        end
    end
end

for i in 0..(matrix.length - 1)
    for j in 0..(matrix[i].length - 1)
        if zero_rows.include? i
            matrix[i][j] = 0
        elsif zero_cols.include? j
            matrix[i][j] = 0
        end
    end
end

puts matrix

