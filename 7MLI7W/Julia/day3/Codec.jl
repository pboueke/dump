# Updated for julia 1.1.1
module Codec

using Images
using FFTW

function makeMask(n)
    dim = Int(ceil(sqrt(n)))
    mask = zeros(dim,dim)
    count = 0
    stop = false
    for i = 1:dim
        if stop
            break
        end
        for j = 1:dim
            mask[i ,j] = 1
            count += 1
            if count >= n
                stop = true
                break
            end
        end
    end
    mask
end

function blockdct(img, n)
    pixels = convert(Array{Float32}, img)

    y, x = size(pixels)

    outx = floor(x/8)
    outy = floor(y/8)

    bx = 1:8:outx*8
    by = 1:8:outy*8

    mask = makeMask(n)
    dim = Int(ceil(sqrt(n)))

    freqs = Array{Float64,2}(undef, Int(outy*dim),Int(outx*dim))

    for is = bx, js = by
        i = Int(is)
        j = Int(js)
        freqs[j:j+dim-1,i:i+dim-1] = dct(pixels[j:j+dim,i:i+7])
        freqs[j:j+dim-1,i:i+dim-1] .*= mask
    end

    freqs
end

function blockidct(freqs, n)
    dim = Int(ceil(sqrt(n)))
    y, x = size(freqs)
    bx = 1:8:x
    by = 1:8:y

    pixels = Array{Float64,2}(undef, Int(y), Int(x))
    for is = bx, js = by
        i = Int(is)
        j = Int(js)
        pixels[j:j+dim-1,i:i+dim-1] = idct(freqs[j:j+dim-1,i:i+dim-1])
    end
    Gray.(pixels)
end

end