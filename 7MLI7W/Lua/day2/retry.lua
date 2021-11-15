-- taken from https://github.com/ryanplusplus/seven-more-languages-in-seven-weeks

function retry(count, body)
    for i = 1,count do
        -- https://www.gammon.com.au/scripts/doc.php?lua=coroutine.wrap
        local result = coroutine.wrap(body)()
        if (type(result) ~= 'string') then 
            return 
        end
    end
end

math.randomseed(os.time())

retry(5, function()
  if math.random() > 0.2 then
    print('failed')
    coroutine.yield('Something bad happened')
  end
  print('succeeded')
end)